package com.springbook.biz.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("homeContorller")
public class HomeController {

    @RequestMapping("/home.do")
    public String home() {
        return "home";
    }

}
