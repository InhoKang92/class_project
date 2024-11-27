package com.classIT.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.classIT.domain.KakaoPayReadyVO;
import com.classIT.service.KakaoPayService;
import com.classIT.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/pay/*")
@Log4j
public class PayController {
	
	private KakaoPayService kakaopayService;

	@GetMapping("/kakaopay")
	public @ResponseBody KakaoPayReadyVO kakaopay(@RequestParam Map<String, Object> params) {
		
		
		KakaoPayReadyVO res = kakaopayService.kakaoPay(params);
		log.info(res.toString());
		return res;
		
	}
	
	@GetMapping("/kakaopay/success")
    public String kakaoPaySuccess() {
        return "list";
    }
	
}
