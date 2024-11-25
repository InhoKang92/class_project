package com.classIT.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.classIT.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList(@Param("product_title") String product_title);
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long product_no);
	public int delete(Long product_no);
	public int update(ProductVO product);
	
}
