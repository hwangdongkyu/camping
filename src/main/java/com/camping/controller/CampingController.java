package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.CampingVO;
import com.camping.service.CampingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/camping/*")
@AllArgsConstructor
public class CampingController {
	
	private CampingService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	@PostMapping("/register")
	public String register(CampingVO camping, RedirectAttributes rttr) {
		
		log.info("register : " + camping);
		
		service.register(camping);
		
		rttr.addFlashAttribute("result", camping.getBoard_no());
		
		return "redirect:/camping/list" ;
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("board_no")Long board_no, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("camping", service.get(board_no));
	}
	
	@PostMapping("/modify")
	public String modify(CampingVO camping, RedirectAttributes rttr) {
		log.info("modify : " + camping);
		
		if(service.modify(camping)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/camping/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("board_no")Long Board_no, RedirectAttributes rttr) {
		log.info("remove......." + Board_no);
		if (service.remove(Board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/camping/list";
	}
	
}
