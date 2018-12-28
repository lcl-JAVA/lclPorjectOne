package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.Users;

public interface TestDao {
	@Select(" select * from users ")
	List<Users> findUsers();
	
	@SuppressWarnings("rawtypes")
	List<Map> findMapPoint(@Param("sheng")String sheng,@Param("shi")String shi,@Param("qu")String qu,@Param("jd")String jd);
	
	@SuppressWarnings("rawtypes")
	List<Map> findMapPointByName(@Param("name")String name);
	
	
	@SuppressWarnings("rawtypes")
	void insertMapPiont(Map map);
	
	@SuppressWarnings("rawtypes")
	void editMapPoint(Map map);
	
	void delectMapPiont(@Param("id")String id);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectMapPiont(@Param("name") String name,@Param("sheng")String sheng,@Param("shi")String shi,@Param("qu")String qu,@Param("jd")String jd,@Param("lx")String lx);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectMapLx(String street_code);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectXqById(String id);
	
}
