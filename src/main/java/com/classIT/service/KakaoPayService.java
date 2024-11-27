package com.classIT.service;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.classIT.domain.KakaoPayReadyVO;

@Service
public class KakaoPayService {

	public KakaoPayReadyVO kakaoPay(Map<String, Object> params) {
		
		HttpHeaders header = new HttpHeaders();
		header.set("Authorization", "SECRET_KEY DEV490A5A3D56EEF4723C2D1684880B300909CA4");
		
		MultiValueMap<String, Object> payParams = new LinkedMultiValueMap<String, Object>();
		
		payParams.add("cid", "TC0ONETIME");
		payParams.add("partner_order_id", "partner_order_id");
		payParams.add("partner_user_id", "partner_user_id");
		payParams.add("item_name", params.get("item_name"));
		payParams.add("quantity", params.get("quantity"));
		payParams.add("total_amount", params.get("total_amount"));
		payParams.add("vat_amount", "200");
		payParams.add("tax_free_amount", params.get("tax_free_amount"));
		payParams.add("approval_url", "http://localhost:8081/pay/kakaopay/success");
		payParams.add("fail_url", "http://localhost:8081/pay/kakaopay/fail");
		payParams.add("cancel_url", "http://localhost:8081/pay/kakaopay/cancel");
		
		HttpEntity<Map> request = new HttpEntity<Map>(payParams, header);
		
		RestTemplate template = new RestTemplate();
		
		String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
		
		KakaoPayReadyVO res = template.postForObject(url, request, KakaoPayReadyVO.class);
		
		return res;
		
	}
	
	
	
	
}
