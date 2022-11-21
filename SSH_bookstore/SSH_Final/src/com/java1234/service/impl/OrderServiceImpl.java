package com.java1234.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.annotations.common.util.*;
import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDao;

import com.java1234.entity.Orders1Entity;
import com.java1234.entity.User;
import com.java1234.service.OrderService;

@Service("OrderService")
public class OrderServiceImpl  implements OrderService{
	@Resource
	private BaseDao<Orders1Entity> baseDao;
	
	@Override
	public void insertintoorder(Orders1Entity order) {
			baseDao.save(order);	
	}
	@Override
	public List findallorder(User user) {
		 String hql = "from Orders1Entity o where o.userId = ?";
	        String param[] = {user.getUser_id()};
	        List list = baseDao.find(hql,param);
	        return list;
	}
}
