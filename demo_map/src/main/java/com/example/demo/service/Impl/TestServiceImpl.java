package com.example.demo.service.Impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TestDao;
import com.example.demo.entity.Users;
import com.example.demo.service.TestService;

@Service
public class TestServiceImpl implements TestService{
	@Resource
	private TestDao dao;

	@Override
	public List<Users> findUsers() throws SQLException {
		return dao.findUsers();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> findMapPoint(String sheng,String shi,String qu,String jd) throws SQLException {
		List<Map> list = dao.findMapPoint(sheng,shi,qu,jd);
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Map<String, Object> insertMapPiont(Map map)throws SQLException {
		dao.insertMapPiont(map);
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("result", "SUCCESS");
		return map1;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map<String, Object> editMapPiont(Map map) throws SQLException {
		dao.editMapPoint(map);
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("result", "SUCCESS");
		return map1;
	}
	
	@Override
	public Map<String, Object> delectMapPiont(String id)throws SQLException {
		dao.delectMapPiont(id);
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("result", "SUCCESS");
		return map1;
	}

	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Map> selectMapPiont(String name,String sheng,String shi,String qu,String jd,String lx)throws SQLException {
		List<Map> list = dao.selectMapPiont(name,sheng,shi,qu,jd,lx);
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> findMapPointByName(String name) throws SQLException {
		List<Map> list = dao.findMapPointByName(name);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectMapLx(String street_code) throws SQLException {
		List<Map> list = dao.selectMapLx(street_code);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectXqById(String id) throws SQLException {
		List<Map> list = dao.selectXqById(id);
		return list;
	}

}
