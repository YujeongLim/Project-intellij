package com.uni.ljss.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.ljss.product.model.dto.PageInfo;
import com.uni.ljss.product.model.dto.Product;

@Repository
public class ProductDao {
	
 public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	    

	 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
	 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
	 
	 return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}
 

 
public int selectListCount(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("productMapper.selectListCount");

}


public Product selectProduct(SqlSessionTemplate sqlSession, String proCode) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("productMapper.selectProduct", proCode);
}



public int deleteProduct(SqlSessionTemplate sqlSession, String proCode) {
	// TODO Auto-generated method stub
	return sqlSession.update("productMapper.deleteProduct", proCode);
}



public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
	// TODO Auto-generated method stub
	return sqlSession.insert("productMapper.insertProduct", p);
}



public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
	// TODO Auto-generated method stub
	return sqlSession.update("productMapper.updateProduct", p);

}



public ArrayList<Product> selectListByOuter(SqlSessionTemplate sqlSession, String cateCode, PageInfo pi) {
    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    // 构建查询参数
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("cateCode", cateCode);

    // 使用 parameters 和 rowBounds 进行分页查询
    return (ArrayList)sqlSession.selectList("productMapper.selectListByOuter", parameters, rowBounds);
}



public ArrayList<Product> selectListByTop(SqlSessionTemplate sqlSession, String cateCode, PageInfo pi) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    // 构建查询参数
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("cateCode", cateCode);

    // 使用 parameters 和 rowBounds 进行分页查询
    return (ArrayList)sqlSession.selectList("productMapper.selectListByTop", parameters, rowBounds);
}



public ArrayList<Product> selectListByBottom(SqlSessionTemplate sqlSession, String cateCode, PageInfo pi) {
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    // 构建查询参数
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("cateCode", cateCode);

    // 使用 parameters 和 rowBounds 进行分页查询
    return (ArrayList)sqlSession.selectList("productMapper.selectListByBottom", parameters, rowBounds);
}



public ArrayList<Product> selectListByShoes(SqlSessionTemplate sqlSession, String cateCode, PageInfo pi) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    // 构建查询参数
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("cateCode", cateCode);

    // 使用 parameters 和 rowBounds 进行分页查询
    return (ArrayList)sqlSession.selectList("productMapper.selectListByShoes", parameters, rowBounds);
}



public ArrayList<Product> selectListByAcc(SqlSessionTemplate sqlSession, String cateCode, PageInfo pi) {
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    // 构建查询参数
    Map<String, Object> parameters = new HashMap<>();
    parameters.put("cateCode", cateCode);

    // 使用 parameters 和 rowBounds 进行分页查询
    return (ArrayList)sqlSession.selectList("productMapper.selectListByAcc", parameters, rowBounds);
}
}












