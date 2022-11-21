package com.java1234.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

    import com.java1234.dao.BaseDao;
import com.java1234.entity.Book;
import com.java1234.service.BookService;
@Service("bookService")

public class BookServiceImpl implements BookService {
	@Resource
	private BaseDao<Book> baseDao;
	
	@Override
	
	public List<Book>  findBookByType(Book book,int cs,int price[]) {
		    List<Book> list = null;
		    String hql =null;
	        if(cs==0)
	        	 hql = "from Book b where b.type = '"+book.getType()+"'";
	        else if(cs==1) //升序
	        	 hql = "from Book b where b.type = '"+book.getType()+"' order by b.price asc";
	        else if(cs==2)  //降序
	        	hql = "from Book b where b.type = '"+book.getType()+"' order by b.price desc";
	        else //区间
	        	hql = "from Book b where b.type = '"+book.getType()+"' and b.price between '"+price[0]+"' and '"+price[1]+"'";
	        String param[] = {};
	        list = baseDao.find(hql,param);

	        System.out.println("结束");
	        return list;
}       
	public List<Book> findbylike(String information,int cs,int price[]){
        List <Book> list = null;
//        String hql = "from Book b ";
        String hql = "from Book b ";       
     String Field[] = {"b.bookName","b.type","b.discription"};
        list = baseDao.findByFields(hql,Field,information,cs,price);
        return list;
    }
	@Override
	public Book findBookById(String bookId) {
		
		String hql = "from Book b where b.bookId=?";
        String param[] = {bookId};
        Book book=baseDao.get(hql, param);
		// TODO Auto-generated method stub
		return book;
	}
	
}
	
