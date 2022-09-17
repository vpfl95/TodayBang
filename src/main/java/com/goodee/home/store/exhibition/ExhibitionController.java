package com.goodee.home.store.exhibition;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exhibitions/*")
public class ExhibitionController {

	@GetMapping("/main")
	public String Home() throws Exception {
		return "/store/exhibitions/exhibitionsHome";
	}
}