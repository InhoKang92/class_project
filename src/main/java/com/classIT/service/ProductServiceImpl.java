package com.classIT.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classIT.domain.ProductVO;
import com.classIT.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public ProductVO get(Long product_no) {
		 log.info("get....." + product_no);
	     return mapper.read(product_no);
	}

	@Override
	public boolean modify(ProductVO product) {
		 log.info("modify.... " + product);
	     return mapper.update(product)==1;
	}

	@Override
	public boolean remove(Long product_no) {
		log.info("remove...." + product_no);
	     return mapper.delete(product_no)==1;
	}

	@Override
	public List<ProductVO> getList(String class_category) {
		log.info("getList.....");
		return mapper.getList(class_category);
	}

	@Override
	public void register(ProductVO product) {
		log.info("register....." + product);
		mapper.insertSelectKey(product);
	}
	
}
