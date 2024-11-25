package com.classIT.service;

import java.util.List;

import com.classIT.domain.ProductVO;

public interface ProductService {
	
   public void register(ProductVO product);
   public ProductVO get(Long product_no);
   public boolean modify(ProductVO product);
   public boolean remove(Long product_no);
   public List<ProductVO> getList(String product_title);
   
}
