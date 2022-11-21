package com.java1234.service;

import java.util.List;
import com.java1234.entity.Orders1Entity;
import com.java1234.entity.User;

public  interface OrderService 
{
	public void insertintoorder(Orders1Entity order);
	public List findallorder(User user);
}
