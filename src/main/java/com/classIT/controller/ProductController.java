package com.classIT.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classIT.domain.ProductVO;
import com.classIT.domain.ScheduleVO;
import com.classIT.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productservice;

	@GetMapping("/list")
    public void list() {
    	
    }
	
    @PostMapping("/product/list")
    public String list(@RequestParam("product_title") String product_title, @RequestParam("product_category") String product_category, Model model) {
    	log.info("list...............");
    	
    	log.info(product_title);
    	
    	List<ProductVO> list = productservice.getList(product_title);
    	
    	log.info("controller" + list);
    	
    	ProductVO vo = list.get(0);
    	
    	model.addAttribute("product_title", product_title);
    	model.addAttribute("list", productservice.getList(product_title));
    	model.addAttribute("list2", vo.getScheduleList());
    	model.addAttribute("selected_Category", product_category);
    	
    	log.info(vo.getScheduleList());
    	
    	
    	
    	return "product/list";
    }
    
//    @GetMapping("/register")
//	public String register(ProductVO product, RedirectAttributes rttr) {
//		log.info("register......." + product);
//
//		productservice.register(product);
//
//		rttr.addFlashAttribute("result", product.getProduct_no());
//		return "redirect:/product/list";
//	}
    
    @GetMapping("/get")
	public void testget(@RequestParam("product_no") Long product_no, Model model) {
		log.info("/get : " + product_no);
		ProductVO vo = productservice.get(product_no);
		log.info(vo);
		model.addAttribute("product", productservice.get(product_no));
	}
    
//    @PostMapping("/modify")
//    public String modify(ProductVO product, RedirectAttributes rttr) {
//   	 log.info("modify:" + product);
//   	 if(productservice.modify(product)) {
//   		 rttr.addFlashAttribute("result", "success");
//   	 }
//   	 return "redirect:/product/list";
//    }
	
    @PostMapping("/remove")
    public String remove(@RequestParam("product_no") Long product_no, RedirectAttributes rttr ) {
   	 log.info("remove...." +product_no);
   	 if(productservice.remove(product_no)) {
   		 rttr.addFlashAttribute("result", "success");
   	 }
   	 return "redirect:/product/list";
    }
    
//    @GetMapping("/register")
//    public void register() {
//    		 
//    }
}
