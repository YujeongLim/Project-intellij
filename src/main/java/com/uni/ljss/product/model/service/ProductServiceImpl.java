package com.uni.ljss.product.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.product.model.dao.ProductDao;
import com.uni.ljss.product.model.dto.PageInfo;
import com.uni.ljss.product.model.dto.Product;



@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
	
		return productDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectListCount() {
		
		return productDao.selectListCount(sqlSession);
	}

	@Override
	public Product selectProduct(String proCode) {
		// TODO Auto-generated method stub
		Product p = productDao.selectProduct(sqlSession, proCode);
		return p;
	}

	@Override
	public void deleteProduct(String proCode) {
		
		int productDelete = productDao.deleteProduct(sqlSession,proCode);
		
		if(productDelete<0) {
			throw new CommException("상품삭제실패 ");
		}
	}

	@Override
	public void insertProduct(Product p) {
        int result = productDao.insertProduct(sqlSession, p);
		
		if(result < 0) {
			throw new CommException("상품추가실패 ");
		}
		
	}

	@Override
	public void updateProduct(Product p) {
       int result = productDao.updateProduct(sqlSession, p);
		
		if(result < 0) {
			throw new CommException("게시글수정실패 ");
		}
		
		
	}

	@Override
	public ArrayList<Product> selectListByOuter(String cateCode, PageInfo pi) {
		
		return productDao.selectListByOuter(sqlSession,cateCode, pi);
	}

	@Override
	public ArrayList<Product> selectListByTop(String cateCode, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListByTop(sqlSession,cateCode, pi); 
	}

	@Override
	public ArrayList<Product> selectListByBottom(String cateCode, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListByBottom(sqlSession,cateCode, pi); 
	}

	@Override
	public ArrayList<Product> selectListByShoes(String cateCode, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListByShoes(sqlSession,cateCode, pi); 

	}

	@Override
	public ArrayList<Product> selectListByAcc(String cateCode, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListByAcc(sqlSession,cateCode, pi); 

	}

	



	


	

	
}
