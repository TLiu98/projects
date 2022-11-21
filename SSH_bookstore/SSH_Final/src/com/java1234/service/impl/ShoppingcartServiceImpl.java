package com.java1234.service.impl;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDao;
import com.java1234.entity.Book;
import com.java1234.entity.Shoppingcart;
import com.java1234.service.ShoppingcartService;

@Service("ShoppingcartService")
public class ShoppingcartServiceImpl implements ShoppingcartService{
	@Resource
	private BaseDao<Shoppingcart> baseDao;
	@Resource
	private BaseDao<Book> baseDao1;
	 public List<Shoppingcart> Findlist(String userId){  //通过用户ID获取购物车表
	        List<Shoppingcart> list = null;
	        String hql = "from Shoppingcart s where s.user_id = ?";
	        String param[] = {userId};
	        list = baseDao.find(hql,param);
	        return list;
	    }	 
	//通过userid和bookid获得一个shoppingcart对象
	 public Shoppingcart findshoppingcart(String user_id,String book_id) 
	 {
		   String hql = "from Shoppingcart s where s.user_id = ? and book_id=?";
	        String param[] = {user_id,book_id};
	       return baseDao.get(hql, param);
	      
	 } 
	 //删除一个shoppingcat记录
	 public boolean detelebook(Shoppingcart shoppingcart) 
	  {
		 
						try{
							baseDao.delete(shoppingcart);
							return true;
						}
						catch(Exception e)
						{
						e.printStackTrace();}
					
					return false;
	  }
	 
	  //插入到购物车
public boolean insert(Shoppingcart shoppingcart){
	try{
		Shoppingcart sp1=null;
		String hql="from Shoppingcart s  where s.user_id =? and s.book_id =?";
				if(baseDao.get(hql, new Object[]{shoppingcart.getUser_id(),shoppingcart.getBook_id()})!=null)
				{ 
//					System.out.println("2");
					sp1=baseDao.get(hql, new Object[]{shoppingcart.getUser_id(),shoppingcart.getBook_id()});
		            sp1.setCount(shoppingcart.getCount()+sp1.getCount());
		            baseDao.save(sp1);
//		            System.out.println("1");
		        }
				else
					baseDao.save(shoppingcart);
		return true;
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
}
		@Override
		public List<Book> findbyid(List<Shoppingcart> list){  //通过购物车列表获取图书表
			ArrayList<Book> list1=new ArrayList<Book>();
	        String hql = "from Book b where b.bookId =?";	       
	        try {  for (int i = 0; i < list.size(); i++){
	        	  String param[] = {list.get(i).getBook_id()};
	        	   list1.add(i,baseDao1.get(hql,param));
	        	   }
	           }
	           catch(Exception e)
	           {
	        	   e.printStackTrace();
	        	   }	        
	        return list1;
	   
}
}
