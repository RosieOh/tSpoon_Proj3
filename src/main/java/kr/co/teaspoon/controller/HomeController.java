package kr.co.teaspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @RequestMapping("/")
    public String home(Locale locale, Model model) {
        logger.info("인덱스 페이지 진입");
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String today = dateFormat.format(date);
        model.addAttribute("today", today);
        model.addAttribute("myName", "오태훈");
        return "/index";
    }
}
