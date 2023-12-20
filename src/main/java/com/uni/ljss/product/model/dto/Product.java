package com.uni.ljss.product.model.dto;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Product {
	private String proCode;
	private String proName;
	private int proPrice;
	private String cateCode;
	private String proSize;
	private int proStock;
	private Date proEntDate;
	private String proStatus;
	private String proImg1;
    private String proImg2;


}
