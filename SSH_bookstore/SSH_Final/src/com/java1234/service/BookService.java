package com.java1234.service;

import java.util.List;

import com.java1234.entity.Book;
import com.java1234.entity.Shoppingcart;

public interface BookService {
	public List<Book>  findBookByType(Book book,int cs,int price[]);
	public Book  findBookById(String bookId);
	public List<Book> findbylike(String information,int cs,int price[]);
//	public List<Book> findbyid(List<Shoppingcart> list);
}

