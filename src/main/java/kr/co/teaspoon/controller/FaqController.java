package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Faq;
import kr.co.teaspoon.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
    @Autowired
    private FaqService faqService;

    @GetMapping("list.do") //faq/list.do
    public String getFaqList(Model model) throws Exception {
        List<Faq> faqList = faqService.faqList();
        model.addAttribute("faqList", faqList);
        return "/faq/faqList";
    }
}
