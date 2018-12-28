package com.example.demo.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.example.demo.entity.Users;

public interface TestService {
	public List<Users> findUsers()throws SQLException;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> findMapPoint(String sheng,String shi,String qu,String jd)throws SQLException;
	
	@SuppressWarnings("rawtypes")
	public List<Map> findMapPointByName(String name)throws SQLException;
	
	
	@SuppressWarnings("rawtypes")
	public Map<String,Object> insertMapPiont(Map map)throws SQLException;
	
	@SuppressWarnings("rawtypes")
	public Map<String,Object> editMapPiont(Map map)throws SQLException;
	
	public Map<String, Object> delectMapPiont(String id)throws SQLException;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectMapPiont(String name,String sheng ,String shi,String qu,String jd,String lx)throws SQLException;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectMapLx(String street_code)throws SQLException;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectXqById(String id)throws SQLException;
	
}
