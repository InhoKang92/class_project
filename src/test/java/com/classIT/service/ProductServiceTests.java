package com.classIT.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classIT.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Autowired
    private ProductService service;
	
	@Test
	public void testRegister() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새상품11");
		product.setOwner_no(10L);
		product.setClass_category("새카테고리11");
//		product.setClass_detail();
		product.setPrice_per_person(10000L);
		product.setMax_capacity(10L);
		product.setLocation("서울시");
		product.setLocation_code("");

	    service.register(product);
	    log.info(product);

	    log.info("생성된 상품 ID(product_no): " + product.getProduct_no());
	}
	
	@Test
	public void testGetList(String product_title) {
	   service.getList(product_title).forEach(product ->log.info(product));
	}
	
	@Test
	public void testGet() {
	         log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove(17L));
	}

	@Test
	public void testUpdate() {
		ProductVO product = service.get(17L);

		if (product == null) {
				return;
		}

		product.setProduct_title("수정된 상품명");
		log.info("MODIFY RESULT: " + service.modify(product));
	}

}
