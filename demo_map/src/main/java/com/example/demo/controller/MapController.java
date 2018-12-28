package com.example.demo.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.TestService;

@Controller
public class MapController {
	@Resource
	private TestService service;
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/map")
	@ResponseBody
	public List<Map> MapPoint(String sheng,String shi,String qu,String jd) throws SQLException{
		List<Map> list = service.findMapPoint( sheng,shi,qu,jd);
		return list;
		
	}
	
	@RequestMapping("insertMapPoint")
	@ResponseBody
	public Map<String,Object> insertMapPoint(String point,String name,String c_name,String c_point,String sheng,String shi,String qu,String jd,String lx,String wgy )throws SQLException{
		Map<String,Object> map = new HashMap<String, Object>();
		String id = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		map.put("id", id);
		map.put("zb", point);
		map.put("name", name);
		map.put("c_name", c_name);
		map.put("c_point", c_point);
		map.put("sheng", sheng);
		map.put("shi", shi);
		map.put("qu", qu);
		map.put("jd", jd);
		map.put("lx", lx);
		map.put("wgy_id", wgy);
		Map<String,Object> map1 = service.insertMapPiont(map);
		return map1;
	}
	@RequestMapping("editMapPoint")
	@ResponseBody
	public Map<String,Object> editMapPoint(String wg_id,String point,String name,String c_name,String c_point,String sheng,String shi,String qu,String jd,String lx,String wgy) throws SQLException{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", wg_id);
		map.put("zb", point);
		map.put("name", name);
		map.put("c_name", c_name);
		map.put("c_point", c_point);
		map.put("sheng", sheng);
		map.put("shi", shi);
		map.put("qu", qu);
		map.put("jd", jd);
		map.put("lx", lx);
		map.put("wgy_id", wgy);
		Map<String,Object> map1 = service.editMapPiont(map);
		return map1;
	}
	
	@RequestMapping("delectMapPoint")
	@ResponseBody
	public Map<String,Object> delectMapPoint(String id)throws SQLException{
		Map<String,Object> map = new HashMap<String, Object>();
		map = service.delectMapPiont(id);
		return map;
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("selectMapPoint")
	@ResponseBody
	public List<Map> selectMapPoint(String name,String sheng,String shi,String qu,String jd,String lx)throws SQLException{
		List<Map> list = service.selectMapPiont(name,sheng,shi,qu,jd,lx);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("selectMapPointByName")
	@ResponseBody
	public List<Map> selectMapPointByName(String name)throws SQLException{
		List<Map> list = service.findMapPointByName(name);
		return list;
	}
	//查询小区类型总数
	@SuppressWarnings("rawtypes")
	@RequestMapping("selectMapLx")
	@ResponseBody
	public List<Map> selectMapLx(String street_code)throws SQLException{
		List<Map> list = service.selectMapLx(street_code);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("selectXqById")
	@ResponseBody
	public List<Map> selectXqById(String id)throws SQLException{
		List<Map> list = service.selectXqById(id);
		return list;
	}
	
}
