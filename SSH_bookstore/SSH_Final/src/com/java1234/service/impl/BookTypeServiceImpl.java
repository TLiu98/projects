package com.java1234.service.impl;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDao;
//import com.java1234.entity.Book;
import com.java1234.entity.BookType;
import com.java1234.service.BookTypeService;

@Service("bookTypeService")
public class BookTypeServiceImpl implements BookTypeService{
	@Resource
	private BaseDao<BookType> baseDao;
	
	 public BookType findtype(BookType bookType){
	        String hql = "from BookType b where b.typeId = 1";
	        String param[] = null;
	        BookType bookType1 = baseDao.get(hql,param);
	        return bookType1;
	    }

}
