package com.classIT.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private Long product_no;
	private String product_title;
	private Long owner_no;
	private String class_category;
	private byte[] class_detail;
	private Long price_per_person;
	private Long max_capacity;
	private String location;
	private String location_code;
	private List<ScheduleVO> scheduleList;
	
}
