package com.hoya.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoya.domain.CategoryVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;
import com.hoya.domain.PageDTO;
import com.hoya.domain.ProductVO;
import com.hoya.service.UserProductService;
import com.hoya.util.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/customer/product/*")
@Controller
public class UserProductController {
	
	
	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	
	private UserProductService service;

	// 상품등록
	@GetMapping("/productInsert")
	public void productInsert(Model model) {
						
		// 1차카테고리정보
		model.addAttribute("mainCategory", service.mainCategory());		
		
	}
	
	// 2차카테고리 정보
	@ResponseBody
	@GetMapping(value = "/subCategory/{mainCategoryCode}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("mainCategoryCode") Integer cate_code){
		
		ResponseEntity<List<CategoryVO>> entity = null;
				
		entity = new ResponseEntity<List<CategoryVO>>(service.subCategory(cate_code), HttpStatus.OK);
		
		return entity;
	}	
	
	//CKEditor 상품설명 이미지.
	@PostMapping("/editor/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam MultipartFile upload) {
		
		/*
		 CKEditor 파일업로드 1)파일업로드 작업 2) 업로드된 파일정보를 브라우저에게 보내야 한다. 
		  
		 */
		
		
		// 클라이언트로부터 전송되어 온 파일을 업로드폴더에 복사(생성)작업
		OutputStream out = null;
		
		// 업로드된 파일정보를 브라우저에게 보내는 작업
		PrintWriter printWriter = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			// 클라이언트에서 전송해 온 파일명을 포함하여, 실제 업로드되는 경로생성
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/") + fileName;
			
			log.info("업로드폴더 물리적경로: " + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath)); // 0byte의 빈 파일생성
			
			// 파일에 내용이 채워짐.
			out.write(bytes);
			out.flush();
			
			/*======================================================================*/
			
			
			String callback = request.getParameter("CKEditorFuncNum");
			
			log.info(callback);
			
			printWriter = response.getWriter();
			
			// <resources mapping="/upload/**" location="/resources/upload/" />
			String fileUrl = "/upload/" + fileName;
			
			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("
								+ callback
								+ ",'"
								+ fileUrl
								+ "','이미지를 업로드 하였습니다.'"
								+ ")</script>");
			printWriter.flush();
			
		
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
			if(out != null) out.close();
			if(printWriter != null) printWriter.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
		}
		
		//return;
		
	}
	
	
	// 상품등록 저장	
	@PostMapping("/productInsert")
	public String productInsert(ProductVO vo, RedirectAttributes rttr, HttpSession session) {
		
		log.info("상품정보" + vo);
		
		// 1)파일업로드
		vo.setPro_img(UploadFileUtils.uploadFile(uploadFolder, vo.getUpload()));
		vo.setPro_uploadpath(UploadFileUtils.getFolder());
		
		// 아이디 가져오기
		vo.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());
		
		// 2)상품정보 저장
		service.productInsert(vo);
		
		rttr.addFlashAttribute("msg", "insertOk");
		
		// 2차카테고리 리스트로 돌아가는 구문
		rttr.addAttribute("cate_code", vo.getCate_code());
		
		return "redirect:/customer/product/productList";
	}
	
	// 2차카테고리에 해당하는 상품리스트
	@GetMapping("/productList")
	public void productList(@ModelAttribute("cri")Criteria cri, @ModelAttribute("cate_code") Integer cate_code, Model model) {
				
		cri.setAmount(4);
		
		List<ProductVO> list = service.getListWithPaging(cate_code, cri);
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		int total = service.getTotalCount(cate_code);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("productList", list);
	}
	
	
	// 메인에서 카테고리별 상품리스트
	@GetMapping("/productMain")
	public void productMain(Model model) {
		
		List<ProductVO> phoneList = service.productListByCategory(1);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<phoneList.size(); i++) {
			ProductVO vo = phoneList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> furnitureList = service.productListByCategory(2);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<furnitureList.size(); i++) {
			ProductVO vo = furnitureList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> stationeryList = service.productListByCategory(3);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<stationeryList.size(); i++) {
			ProductVO vo = stationeryList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		List<ProductVO> computerList = service.productListByCategory(4);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<computerList.size(); i++) {
			ProductVO vo = computerList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> lifeList = service.productListByCategory(5);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<lifeList.size(); i++) {
			ProductVO vo = lifeList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> figureList = service.productListByCategory(6);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<figureList.size(); i++) {
			ProductVO vo = figureList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		List<ProductVO> cameraList = service.productListByCategory(7);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<cameraList.size(); i++) {
			ProductVO vo = cameraList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> gameList = service.productListByCategory(8);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<gameList.size(); i++) {
			ProductVO vo = gameList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> homeappList = service.productListByCategory(9);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<homeappList.size(); i++) {
			ProductVO vo = homeappList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> womenswList = service.productListByCategory(10);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<womenswList.size(); i++) {
			ProductVO vo = womenswList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> menswList = service.productListByCategory(11);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<menswList.size(); i++) {
			ProductVO vo = menswList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> shoesbagList = service.productListByCategory(12);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<shoesbagList.size(); i++) {
			ProductVO vo = shoesbagList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> bookList = service.productListByCategory(13);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<bookList.size(); i++) {
			ProductVO vo = bookList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		List<ProductVO> sportsList = service.productListByCategory(14);
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<sportsList.size(); i++) {
			ProductVO vo = sportsList.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		model.addAttribute("phoneProductList", phoneList);
		model.addAttribute("furnitureProductList", furnitureList);
		model.addAttribute("stationeryProductList", stationeryList);
		model.addAttribute("computerProductList", computerList);
		model.addAttribute("lifeProductList", lifeList);
		model.addAttribute("figureProductList", figureList);		
		model.addAttribute("cameraProductList", cameraList);
		model.addAttribute("gameProductList", gameList);
		model.addAttribute("homeappProductList", homeappList);
		model.addAttribute("womenswProductList", womenswList);
		model.addAttribute("menswProductList", menswList);
		model.addAttribute("shoesbagProductList", shoesbagList);
		model.addAttribute("bookProductList", bookList);
		model.addAttribute("sportsProductList", sportsList);
		
	}
	
	// 상품상세정보
	@GetMapping("/productDetail")
	public void productDetail(@RequestParam(value = "type", defaultValue = "Y" ) String type, @ModelAttribute("cri") Criteria cri, @RequestParam("cate_code") Integer cate_code, @RequestParam("pro_num") Integer pro_num, Model model) {
		
		ProductVO vo = service.productDetail(pro_num);
		vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		
		model.addAttribute("productVO", vo);
		model.addAttribute("type", type);
		
	}
	
	// 상품리스트의 이미지출력
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName){
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName);
		
		return entity;
	}
	
	// 회원아이디 정보에 따른 상품리스트 가져오기
	@GetMapping("/mystore")
	public void mystore(@ModelAttribute("cri")Criteria cri, HttpSession session, Model model) {		
		
		cri.setAmount(4);
		
		String hmal_id = ((CustomerVO) session.getAttribute("loginStatus")).getHmal_id();
		
		List<ProductVO> list = service.mystore(hmal_id, cri);
		
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
								
		model.addAttribute("myproduct", list);
		
	}
	
	// 상품수정
	@GetMapping("/productModify")
	public void productModify(@RequestParam(value="pro_num", required=false) Integer pro_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		ProductVO vo = service.productModify(pro_num);
		vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		model.addAttribute("productVO", vo);
		
		model.addAttribute("mainCategory", service.mainCategory());
		model.addAttribute("subCategory", service.subCategory(vo.getCate_prt_code()));
	}
	
	// 상품수정 저장
	@PostMapping("/productModify")
	public String productModifyOk(Criteria cri, ProductVO vo, RedirectAttributes rttr) {
		
		if(vo.getUpload().getSize() > 0) {
			
			UploadFileUtils.deleteFile(uploadFolder, vo.getPro_uploadpath(), vo.getPro_img());
			
			vo.setPro_img(UploadFileUtils.uploadFile(uploadFolder, vo.getUpload()));
			vo.setPro_uploadpath(UploadFileUtils.getFolder());
		}
		
		service.productModifyOk(vo);		
				
		return "redirect:/customer/product/mystore";
	}
	
	
}
