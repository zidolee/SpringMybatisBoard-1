package com.springbook.biz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller("homeContorller")
public class HomeController {

    @RequestMapping("/home.do")
    public String home() {
        return "home";
    }

}

