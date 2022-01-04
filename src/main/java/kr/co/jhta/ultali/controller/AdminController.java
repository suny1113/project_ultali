package kr.co.jhta.ultali.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@RequestMapping("reportList")
	public String reportList() {
		return "admin/reportList";
	}
	
}
