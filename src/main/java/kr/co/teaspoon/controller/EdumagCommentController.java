package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.EdumagComment;
import kr.co.teaspoon.service.EdumagCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/edumagComment/*")
public class EdumagCommentController {

    @Autowired
    private EdumagCommentService edumagCommentService;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/edumag/edumagCommentInsert";
    }

    @PostMapping("insert.do")
    public String edumagCommentInsert(HttpServletRequest request, Model model) throws Exception {
        EdumagComment edumagComment = new EdumagComment();
        edumagComment.setAuthor(request.getParameter("author"));
        edumagComment.setContent(request.getParameter("content"));
        edumagComment.setPar(Integer.parseInt(request.getParameter("par")));
        edumagCommentService.edumagCommentInsert(edumagComment);
        return "redirect:/edumag/detail.do?no="+request.getParameter("par");
    }

    @GetMapping("delete.do")
    public ModelAndView edumagCommentDelete(HttpServletRequest request, Model model) throws Exception {
        int dno = Integer.parseInt(request.getParameter("dno"));
        int no = Integer.parseInt(request.getParameter("no"));
        edumagCommentService.edumagCommentDelete(dno);
        model.addAttribute("no", no);
        ModelAndView mav = new ModelAndView();
        mav.setView(new RedirectView(request.getContextPath() + "/edumag/detail.do"));
        return mav;
    }

}
