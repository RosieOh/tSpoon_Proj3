package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.NoticeComment;
import kr.co.teaspoon.dto.Qna;
import kr.co.teaspoon.dto.QnaComment;
import kr.co.teaspoon.service.QnaService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
    @Autowired
    private QnaService qnaService;

    @GetMapping("list.do") //notice/list.do
    public String getQnaList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = qnaService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Qna> qnaList = qnaService.qnaList(page);
        model.addAttribute("qnaList", qnaList);
        List<Qna> selectBest = qnaService.selectBest();
        model.addAttribute("selectBest",selectBest);
        List<Qna> selectVisit = qnaService.selectVisit();
        model.addAttribute("selectVisit",selectVisit);
        List<Qna> commentCount= qnaService.commentCount();
        model.addAttribute("commentCount",commentCount);

        return "/qna/qnaList";
    }

    @GetMapping("detail.do")	//board/detail.do?seq=1
    public String getQnaDetail(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = qnaService.qnaDetail(qno);
        List<QnaComment> commentList = qnaService.qnaCommentList(qno);
        model.addAttribute("dto", dto);
        model.addAttribute("lev",lev);
        model.addAttribute("commentList", commentList);
        return "/qna/qnaDetail";
    }

    @PostMapping("detail.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        QnaComment dto = new QnaComment();
        dto.setContent(request.getParameter("content"));
        dto.setQno(qno);
        dto.setAuthor(request.getParameter("author"));
        qnaService.commentInsert(dto);
        return "redirect:detail.do?qno="+qno+"&lev="+lev;
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        int lev = Integer.parseInt(request.getParameter("lev"));
        model.addAttribute("lev", lev);
        int par = Integer.parseInt(request.getParameter("par"));
        model.addAttribute("par", par);
        return "/qna/qnaInsert";
    }

    @PostMapping("insert.do")
    public String qnaInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setLev(Integer.parseInt(request.getParameter("lev")));
        dto.setPar(Integer.parseInt(request.getParameter("par")));
        dto.setAuthor(request.getParameter("author"));

        qnaService.qnaInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = new Qna();
        dto.setQno(qno);
        dto.setLev(lev);
        qnaService.qnaDelete(dto);
        return "redirect:list.do";
    }

    @GetMapping("commentDelete.do")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int cno = Integer.parseInt(request.getParameter("cno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        qnaService.commentDelete(cno);
        return "redirect:detail.do?qno="+qno+"&lev="+lev;
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = qnaService.qnaDetail(qno);
        model.addAttribute("dto", dto);
        model.addAttribute("lev", lev);
        return "/qna/qnaEdit";
    }

    @PostMapping("edit.do")
    public String qnaEdit(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        String author = request.getParameter("author");
        Qna dto = new Qna();
        dto.setQno(qno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor(author);
        qnaService.qnaEdit(dto);
        return "redirect:list.do";
    }
}