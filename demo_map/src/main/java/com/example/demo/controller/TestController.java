package com.example.demo.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.Users;
import com.example.demo.service.TestService;
import com.example.demo.util.Qrcode;

@Controller
public class TestController {
	@Resource
	private TestService service;
	
	
	@RequestMapping("/test")
	public String test() throws SQLException{
		return "indexAll";
	}
	@RequestMapping("/test2")
	@ResponseBody
	public List<Users> findUser() throws SQLException{
		return service.findUsers();
	}
	
	@RequestMapping("/test3")
	public String test3() throws SQLException{
		return "index";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping("/test4")
	@ResponseBody
	public Map<String,Object> test4(){
		String path = Qrcode.createQrcode("12345");
		
		
		String  img = "D:/qrcode/1168584931.png";
		String path2 = Qrcode.decodeQr(img);
		
		Map<String,Object> map = new  HashMap<String, Object>();
		map.put("test", "成功了！");
		return map;
	} 
	/**
	 * jsp页面访问其他盘（C盘D盘等）里的图片        <img src="http:......../showImage?path=D:/1.png">
	 * @param response
	 * @param path
	 * @throws Exception
	 */
	@RequestMapping("/showImage")
	public void showImage(HttpServletResponse response,String path) throws Exception {  
	        try{
	        FileInputStream fis = new FileInputStream(path); // 以byte流的方式打开文件 d:\1.gif   
	            int i=fis.available(); //得到文件大小   
	            byte data[]=new byte[i];   
	            fis.read(data);  //读数据   
	            response.setContentType("image/*"); //设置返回的文件类型   
	            OutputStream toClient=response.getOutputStream(); //得到向客户端输出二进制数据的对象   
	            toClient.write(data);  //输出数据   
	            toClient.flush();  
	            toClient.close();   
	            fis.close();
	        }catch(Exception e){
	        e.printStackTrace();
	        System.out.println("图片不存在");
	        }
	}
	
}
