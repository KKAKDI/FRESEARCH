package org.fs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping("")
	public String index() {
		return "index";
	}
	@RequestMapping("/upTest")
	public String test() {
		return "upTest";
	}
	@RequestMapping(value = "/progress2")
	public ModelAndView progress2(Model model) {
		ModelAndView mv = new ModelAndView("/test/progress2");
		return mv;
	}

	@RequestMapping("/fileUpload")
	public void fileUpload(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
		//파일경로
		String filePath ="C:/Upload/";
		
		//파일들을 List형식으로 보관
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		
		File file = new File(filePath);
		//파일이 없다면 디렉토리를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		for (int i = 0; i < files.size(); i++) {
			System.out.println(files.get(i).getOriginalFilename() +" 업로드");
			//파일 업로드 소스 여기에 삽입
			file = new File(filePath+files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);	
		}		
	}
}
