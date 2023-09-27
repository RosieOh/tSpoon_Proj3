package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.FreeService;
import kr.co.teaspoon.service.MemberService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/free/*")
public class FreeController {

    @Autowired
    private FreeService freeService;

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @GetMapping("list.do")        //free/list.do
    public String getFreeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Free> commentCount = freeService.commentCount();
        Map<Integer, Integer> commentMap = new HashMap<>();
        for (Free fr : commentCount) {
            commentMap.put(fr.getBno(), fr.getCount());
        }

        List<Free> freeList = freeService.freeList(page);
        model.addAttribute("freeList", freeList);
        List<Free> freeBestRecList = freeService.freeBestRecList();
        model.addAttribute("freeBestRecList", freeBestRecList);
        List<Free> freeBestCmtList = freeService.freeBestCmtList();
        model.addAttribute("freeBestCmtList", freeBestCmtList);
        //System.out.println("최다 댓글 리스트 : " + freeBestCmtList);
        for (Free fr :freeBestCmtList) {
            fr.setCount(commentMap.get(fr.getBno()));
        }
        for (Free free : freeList) {
            int bno = free.getBno();
            free.setCount(commentMap.get(bno));
        }
        return "/free/freeList";
    }

    @GetMapping("detail.do")    //free/detail.do?bno=1
    public String getfreeDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        String id = (String) session.getAttribute("sid");

        Free freeDTO = freeService.freeDetail(bno);
        Reco recoDTO = freeService.findReco(bno, id);
        Member memberDTO = memberService.getMember(id);

        model.addAttribute("freeDTO", freeDTO);
        model.addAttribute("recoDTO", recoDTO);
        model.addAttribute("memberDTO", memberDTO);

        List<FreeComment> commentList = freeService.freeCommentList(bno);
        //System.out.printf("bno : %d, id : %s\n", bno, id);
        //System.out.println("댓글 목록 : " + commentList);

        model.addAttribute("commentList", commentList);
        return "/free/freeDetail";
    }

    @PostMapping("detail.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        FreeComment dto = new FreeComment();
        dto.setContent(request.getParameter("content"));
        dto.setBno(bno);
        dto.setAuthor(request.getParameter("author"));
        freeService.commentInsert(dto);
        return "redirect:detail.do?bno="+bno;
    }

    @GetMapping("commentDelete.do")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        int cno = Integer.parseInt(request.getParameter("cno"));
        freeService.commentDelete(cno);
        return "redirect:detail.do?bno="+bno;
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/free/freeInsert";
    }

    @PostMapping("insert.do")
    public String freeInsert(HttpServletRequest request, Model model) throws Exception {
        Free dto = new Free();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setId((String) session.getAttribute("sid"));
        freeService.freeInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        freeService.freeDelete(bno);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Free dto = freeService.freeDetail(bno);
        model.addAttribute("dto", dto);
        return "/free/freeEdit";
    }

    @PostMapping("edit.do")
    public String freeEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Free dto = new Free();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        freeService.freeEdit(dto);
        return "redirect:list.do";
    }

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            //String path = "C:\\hansun\\springframework\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
            String path = request.getRealPath("/resource/uploadckImage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:" + path);    // 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/team23_war/free/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value = "ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        //String path = "C:\\hansun\\springframework\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
        String path = request.getRealPath("/resource/uploadckImage/");
        System.out.println("path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

//    @RequestMapping(value="rec", method=RequestMethod.POST)
//    public @ResponseBody int rec(@ModelAttribute Reco reco) throws Exception {
//        //int result = bs.insertLike(like);
//        int result = freeService.insertReco(reco);
//        return result;
//    }
    @PostMapping("rec")
    @ResponseBody
    public int rec(@ModelAttribute Reco reco) throws Exception {
        int result = freeService.insertReco(reco);
        System.out.println("result : " + result);
        //reco.

        return result;
    }
}
