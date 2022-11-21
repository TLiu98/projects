package com.java1234.service;

import java.util.ArrayList;
import java.util.List;

import com.java1234.entity.Book;
//import com.java1234.entity.Book;
import com.java1234.entity.Shoppingcart;

public interface ShoppingcartService {
	   
	   public boolean insert(Shoppingcart shoppingcart);//插入
	   public List<Shoppingcart> Findlist(String userId);//获取购物车表
	   public Shoppingcart findshoppingcart(String user_id,String book_id);//获取shoppingcart对象
	    public List<Book> findbyid(List<Shoppingcart> list);//通过购物车表获取图书表
	    public boolean detelebook(Shoppingcart shoppingcart);//删除表
}
