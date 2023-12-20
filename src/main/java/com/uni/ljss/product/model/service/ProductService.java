package com.uni.ljss.product.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.uni.ljss.product.model.dto.PageInfo;
import com.uni.ljss.product.model.dto.Product;

public interface ProductService {
	
	
	

	ArrayList<Product> selectList(PageInfo pi);

	int selectListCount();

	Product selectProduct(String proCode);

	void deleteProduct(String proCode);

	void insertProduct(Product p);

	void updateProduct(Product p);

	ArrayList<Product> selectListByOuter(String cateCode, PageInfo pi);

	ArrayList<Product> selectListByTop(String cateCode, PageInfo pi);

	ArrayList<Product> selectListByBottom(String cateCode, PageInfo pi);

	ArrayList<Product> selectListByShoes(String cateCode, PageInfo pi);

	ArrayList<Product> selectListByAcc(String cateCode, PageInfo pi);



	

}
