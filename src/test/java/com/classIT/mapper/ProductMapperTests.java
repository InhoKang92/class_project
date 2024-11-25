package com.classIT.mapper;

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
public class ProductMapperTests {

	@Autowired
    private ProductMapper mapper;
	
//	@Test
//	public void testGetList() {
//        mapper.getList().forEach(product->log.info(product));
//	}
	
	
	
	@Test
	public void testInsert() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새상품");
		product.setOwner_no(10L);
		product.setClass_category("새카테고리");
//		product.setClass_detail();
		product.setPrice_per_person(10000L);
		product.setMax_capacity(10L);
		product.setLocation("서울시");
		product.setLocation_code("");
		
		mapper.insert(product);
		log.info(product);
	}
	
	
	@Test
	public void testInsertSelectKey() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새상품 select key");
		product.setOwner_no(10L);
		product.setClass_category("새카테고리 select key");
//		product.setClass_detail();
		product.setPrice_per_person(10000L);
		product.setMax_capacity(10L);
		product.setLocation("서울시");
		product.setLocation_code("");

	    mapper.insertSelectKey(product);
	    log.info(product);

	    log.info("생성된 상품 ID(product_no): " + product.getProduct_no());
	  
	}
	
	@Test
	public void testRead() {
		ProductVO product = mapper.read(1L);
		log.info(product);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT :" + mapper.delete(17L));
	}
	
	@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		product.setProduct_no(17L);
		product.setProduct_title("수정된 상품");
		product.setOwner_no(10L);
		product.setClass_category("수정된 카테고리");
//		product.setClass_detail();
		product.setPrice_per_person(10000L);
		product.setMax_capacity(10L);
		product.setLocation("서울시");
		product.setLocation_code("");
		
		int count = mapper.update(product);
		log.info("UPDATE COUNT: " + count);
	}

}
