package com.java1234.action;

import com.java1234.entity.BookType;
import com.java1234.service.BookService;
import com.java1234.service.BookTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class BookTypeAction extends ActionSupport {
    private BookType bookType;
    public BookType getBookType() {
		return bookType;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	private String msg;
    private BookTypeService bookTypeService;
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

	public BookTypeService getBookTypeService() {
		return bookTypeService;
	}

	public void setBookTypeService(BookTypeService bookTypeService) {
		this.bookTypeService = bookTypeService;
	}

	public String FindType(){
        String forward = "";
        BookType bookType1 = (bookTypeService.findtype(bookType));
        if (bookType1 != null){
            msg="鎭枩锛佺櫥褰曟垚鍔燂紒";
            //saveinformation(userEntity1);
            forward="success";
        }
        else{
            msg="对不起";
            forward="error";
        }
        return forward;
    }
}

