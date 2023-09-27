package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Notice;
import kr.co.teaspoon.dto.NoticeComment;
import kr.co.teaspoon.service.NoticeService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("list.do") //notice/list.do
    public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);

        List<Notice> selectComment = noticeService.selectComment();
        model.addAttribute("selectComment",selectComment);

        List<Notice> commentCount = noticeService.commentCount();
        model.addAttribute("commentCount",commentCount);

        List<Notice> newNotice = noticeService.newNotice();
        model.addAttribute("newNotice", newNotice);
        return "/notice/noticeList";
    }

    @GetMapping("detail.do")	//board/detail.do?seq=1
    public String getNoticeDetail(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        List<NoticeComment> commentList = noticeService.noticeCommentList(nno);
        model.addAttribute("dto", dto);
        model.addAttribute("commentList", commentList);


        return "/notice/noticeDetail";
    }

    @PostMapping("detail.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        NoticeComment dto = new NoticeComment();
        dto.setContent(request.getParameter("content"));
        dto.setNno(nno);
        dto.setAuthor(request.getParameter("author"));
        noticeService.commentInsert(dto);
        return "redirect:detail.do?nno="+nno;
    }
    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/notice/noticeInsert";
    }

    @PostMapping("insert.do")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception {
        Notice dto = new Notice();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        noticeService.noticeDelete(nno);
        return "redirect:list.do";
    }

    @GetMapping("commentDelete.do")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        int cno = Integer.parseInt(request.getParameter("cno"));
        noticeService.commentDelete(cno);
        return "redirect:detail.do?nno="+nno;
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        model.addAttribute("dto", dto);
        return "/notice/noticeEdit";
    }

    @PostMapping("edit.do")
    public String noticeEdit(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = new Notice();
        dto.setNno(nno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeEdit(dto);
        return "redirect:list.do";
    }

}