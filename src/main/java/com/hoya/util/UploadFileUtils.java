package com.hoya.util;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

// 업로드 관련기능을 담당하는 클래스
@Log4j
public class UploadFileUtils {

	/*
	 * 파일업로드
	 * 파일출력(display) : 이미지를 클라이언트에게 보내는 기능
	 * 파일삭제 
	 * 
	 * 보조 - 업로드시 날짜폴더생성, 이미지파일여부체크-썸네일생성
	 * 
	 */
			
	
	//기능:파일업로드
	// 리턴타입 : String (업로드 파일명))
	// 파라미터: uploadPath (서버측의 업로되는 기본폴더명)
	// 파라미터 : MultipartFile uploadFile(첨부된 파일참조)
	public static String uploadFile(String uploadFolder, MultipartFile multipartFile ) {
		
		//String uploadFolder = "C:\\Dev\\upload"; // 
		
		String uploadFolderPath = getFolder(); // "운영체제별 구분자를 이용하여" "2022\02\17"
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);  
		
		// uploadPath객체가 관리하는 폴더가 존재유무체크.    예>  "D:\\Dev\\upload" "2022/01/18"
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs(); // 현재폴더명을 기준하여 상위폴더가 존재하지 않으면 모두 생성
		}

		// 클라이언트에서 보낸 파일명
		String uploadFileName = multipartFile.getOriginalFilename();		
			
		// 중복되지 않는 문자열을 생성
		UUID uuid = UUID.randomUUID();
			
		// 중복되지 않는 문자열을 생성_클라이언트파일명
		uploadFileName = uuid.toString() + "_" + uploadFileName;
				
		try {
			// "D:\\Dev\\upload" "2022\\01\\18" + 유일한 파일명
			File saveFile = new File(uploadPath, uploadFileName);
			multipartFile.transferTo(saveFile); //파일복사(업로드)
						
			//업로드 파일이 이미지파일인지 일반파일인지 체크
			if(checkImageType(saveFile)) {			
				//Thumnail 이미지 생성작업
				
				// 출력스트림객체가 생성됨 - 비워있는 파일생성(0byte)
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
				//빈파일에 원본이미지 정보를 읽어와서 썸네일이미지 생성작업
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				
				thumbnail.close();
			}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return uploadFileName;
	}
	
	// 
	// 파일 출력하는 기능: 클라이언트에게 이미지파일의 바이트배열을 보내는 작업.  d:\\dep\\upload\\날짜폴더명\\파일명
	public static ResponseEntity<byte[]> getFileByte(String uploadFolder, String uploadPath, String fileName ){
		
		ResponseEntity<byte[]> entity = null;
		
		File file = new File(uploadFolder + "\\" + uploadPath + "\\" +fileName);
		
		
		try {
		HttpHeaders header = new HttpHeaders();
		
		header.add("Content-Type", Files.probeContentType(file.toPath())); // 브라우저에게 보내는 파일에 대한 MIME정보제공
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		//entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		 
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return entity;
		
		
	}
	
	
	// 업로드되는 파일이 이미지파일 여부를 체크
	private static boolean checkImageType(File saveFile) {

		try {
			// 업로드 된 파일에 대한 MIME정보를 읽어오는 기능. *.sql 파일확장자에 대한 MIME정보가 null
			String contentType = Files.probeContentType(saveFile.toPath());  // text/html, text/plain 등

			return contentType.startsWith("image"); // MIME정보가 존재하지 않으면, NullPointerException 예외발생
		} catch (Exception e) {  // IOException 예외처리주의 할것.
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	
	// 날짜를 이용한 업로드 폴더명 생성
	public static String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date); // "2022-02-17"
		
		
		// File.separator 운영체제별 파일경로 구분자를 반환한다. 윈도우> c:\temp\..    리눅스> /home/etc/..
		return str.replace("-", File.separator);  
	}
	
	// 파일삭제.
	public static void deleteFile(String uploadFolder, String uploadPath, String fileName) {
	
		//롬복 로그기능 안됨.
		/*
		System.out.println("파일명:" + uploadFolder);
		System.out.println("파일명:" + uploadPath);
		System.out.println("파일명:" + fileName);
		*/
		//원본이미지, 썸네일이미지 삭제작업
		new File(uploadFolder+ "\\"+ uploadPath.replace('/', File.separatorChar), fileName).delete();
		new File(uploadFolder+"\\"+uploadPath.replace('/', File.separatorChar), "s_" + fileName).delete();
	}
	
	
}
