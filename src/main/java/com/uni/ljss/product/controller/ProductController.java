package com.uni.ljss.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.ljss.common.CommException;
import com.uni.ljss.common.Pagination;
import com.uni.ljss.product.model.dto.PageInfo;
import com.uni.ljss.product.model.dto.Product;
import com.uni.ljss.product.model.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//상품 리스트
	
	@RequestMapping("productListpage")
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
       
		int listCount = productService.selectListCount();
		System.out.println( listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);
		ArrayList<Product>productList = productService.selectList(pi);
		
		
		model.addAttribute("productList",productList);
		model.addAttribute("pi",pi);
		
		return "product/productList";
				
	}
	
	@RequestMapping("outerListpage")
	public String selectListByOuter(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, String cateCode, Model model) {
	    int listCount = productService.selectListCount();
	    System.out.println( listCount);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);

	    ArrayList<Product> outerList = productService.selectListByOuter(cateCode, pi);

	    model.addAttribute("outerList", outerList);
	    model.addAttribute("pi", pi);

	    return "product/outerList";
	}
	
	@RequestMapping("topListpage")
	public String selectListByTop(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, String cateCode, Model model) {
	    int listCount = productService.selectListCount();
	    System.out.println( listCount);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);

	    ArrayList<Product> topList = productService.selectListByTop(cateCode, pi);

	    model.addAttribute("topList", topList);
	    model.addAttribute("pi", pi);

	    return "product/TopList";
	}
	
	@RequestMapping("bottomListpage")
	public String selectListByBottom(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, String cateCode, Model model) {
	    int listCount = productService.selectListCount();
	    System.out.println( listCount);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);

	    ArrayList<Product> bottomList = productService.selectListByBottom(cateCode, pi);

	    model.addAttribute("bottomList", bottomList);
	    model.addAttribute("pi", pi);

	    return "product/bottomList";
	}
	
	@RequestMapping("shoesListpage")
	public String selectListByShoes(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, String cateCode, Model model) {
	    int listCount = productService.selectListCount();
	    System.out.println( listCount);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);

	    ArrayList<Product> shoesList = productService.selectListByShoes(cateCode, pi);

	    model.addAttribute("shoesList", shoesList);
	    model.addAttribute("pi", pi);

	    return "product/shoesList";
	}
	
	@RequestMapping("accListpage")
	public String selectListByAcc(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, String cateCode, Model model) {
	    int listCount = productService.selectListCount();
	    System.out.println( listCount);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 2, 15);

	    ArrayList<Product> accList = productService.selectListByAcc(cateCode, pi);

	    model.addAttribute("accList", accList);
	    model.addAttribute("pi", pi);

	    return "product/accList";
	}
	



	
	
	@RequestMapping("detailProduct")
	public String selectProduct(String proCode, Model model) {
		
		Product p = productService.selectProduct(proCode);
		
		model.addAttribute("p",p);
		
		return "product/productDetail";
	}
	
	@RequestMapping("updateProductPage")
	public ModelAndView updateForm(String proCode,ModelAndView mv) {
		mv.addObject("p", productService.selectProduct(proCode))
		.setViewName("product/productUpdate");
		
		return mv;
	}
	
	@RequestMapping("updateProduct")
	public String updateProduct(Product p, HttpServletRequest request,
	                             @RequestParam(name = "reProImgs", required=false) List<MultipartFile> files,
	                             @RequestParam(name = "proImg1", required=false) String proImg1,
	                             @RequestParam(name = "proImg2", required=false) String proImg2) {
  
	    String orgImgName1 = p.getProImg1();
	    String orgImgName2 = p.getProImg2();

	    if (files != null && !files.isEmpty()) {
	        for (int i = 0; i < Math.min(files.size(), 2); i++) {
	            MultipartFile file = files.get(i);

	            if (i == 0) {
	                if (!file.getOriginalFilename().equals("")) {
	                    try {
							String changeName = saveFile(file, request);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	                    p.setProImg1(file.getOriginalFilename());
	                 
	                }
	            } else if (i == 1) {
	                if (!file.getOriginalFilename().equals("")) {
	                    try {
							String changeName = saveFile(file, request);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	                    p.setProImg2(file.getOriginalFilename());
	                  
	                }
	            }
	        }
	    }else {
	        // 如果没有上传新照片，则将原照片文件名设置回产品实体
	        p.setProImg1(proImg1);
	        p.setProImg2(proImg2);
	    }

	    productService.updateProduct(p);

	   

	    if (orgImgName1 != null && !orgImgName1.equals(p.getProImg1())) {
	        deleteFile(orgImgName1, request);
	    }

	    if (orgImgName2 != null && !orgImgName2.equals(p.getProImg2())) {
	        deleteFile(orgImgName2, request);
	    }


	    return "redirect:productListpage";
	}
	// 保存文件
    public static String saveFile(MultipartFile file, HttpServletRequest request) throws IOException {
        if (file != null && !file.isEmpty()) {
            String resources = request.getSession().getServletContext().getRealPath("resources");
            String savePath = resources + "\\upload_files\\";

            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            String filePath = savePath + fileName;

            // 保存文件到指定路径
            file.transferTo(new File(filePath));

            return fileName; // 返回文件名
        }
        return null; // 文件为空时返回 null
    }

    // 删除文件
    public static void deleteFile(String fileName, HttpServletRequest request) {
        if (fileName != null && !fileName.isEmpty()) {
            String resources = request.getSession().getServletContext().getRealPath("resources");
            String filePath = resources + "\\upload_files\\" + fileName;

            // 删除文件
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }
        }
    }

	
	

    

	
	


	
	

	
	
	@RequestMapping("deleteProduct")
	private String deleteBoard(String proCode, HttpServletRequest request) {
		
		productService.deleteProduct(proCode);
		
		return "redirect:productListpage";
	}
	
	@RequestMapping("insertProductpage")
	public String enrollForm() {
		return "product/productInsert";
	}
	
	

	@RequestMapping("insertProduct")
	public String insertProduct(Product p, HttpServletRequest request,
	                             @RequestParam(name = "proImgs", required = false) List<MultipartFile> files) {
	    System.out.println(p);

	    if (files != null && !files.isEmpty()) {
	        List<String> originalNames = new ArrayList<>();

	        for (int i = 0; i < Math.min(files.size(), 2); i++) {
	            MultipartFile file = files.get(i);
	            originalNames.add(file.getOriginalFilename());

	            if (i == 0) {
	                p.setProImg1(file.getOriginalFilename());
	            } else if (i == 1) {
	                p.setProImg2(file.getOriginalFilename());
	            }

	            // 保存文件
	            try {
	                String resources = request.getSession().getServletContext().getRealPath("resources");
	                String savePath = resources + "\\upload_files\\";

	                String fileName = file.getOriginalFilename();
	                file.transferTo(new File(savePath + fileName));
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	                throw new CommException("File Upload Error");
	            }
	        }
	    }

	    productService.insertProduct(p);
	    
	     
	        return "redirect:productListpage";
	    }
	 
	        
	     
	    

	 
	



	   
	}




	
	
	
	
	

