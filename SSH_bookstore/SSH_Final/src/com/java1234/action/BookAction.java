package com.java1234.action;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;
import java.util.Map;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.java1234.entity.Book;
import com.java1234.entity.User;
import com.java1234.service.BookService;
import com.java1234.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.shao.Util.SendCode;

@Controller
public class BookAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;

	@Resource(name="bookService")
	private BookService bookService;
	private Book book;
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}

    private String information;

    public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	//分类显示
	public String FindByType(){
		int cs=0;  //默认不做任何筛选排序
		 int [] price = new int[2]; 
		
		if(request.getParameter("asc")!=null) cs=1;  //升序
		else if(request.getParameter("desc")!=null) cs=2;  //降序
		else if(request.getParameter("minPrice")!=null){
			cs=3;   price[0]=Integer.parseInt((String)request.getParameter("minPrice"));
			price[1]=Integer.parseInt(request.getParameter("maxPrice"));
		}           //区间
		
		
        String forword = "";
        List<Book> list = null;
       list = bookService.findBookByType(book,cs,price);
        if (list.size() != 0){
            msg = "";
       ValueStack stack = ActionContext.getContext().getValueStack();//�
       stack.set("bookList",list);//
            forword = "success";
        }
     
   else{
            msg= "所选类型暂无书籍在售";
            forword = "error";
        }
    
    return forword;
    }
    public String FindByLike(){
    	int cs=0;  //默认不做任何筛选排序
		 int [] price = new int[2]; 
		
		if(request.getParameter("asc")!=null) cs=1;  //升序
		else if(request.getParameter("desc")!=null) cs=2;  //降序
		else if(request.getParameter("minPrice")!=null){
			
			cs=3;   price[0]=Integer.parseInt((String)request.getParameter("minPrice"));
			price[1]=Integer.parseInt(request.getParameter("maxPrice"));
			System.out.println(price[0]+"##"+price[1]);
		}           //区间
		
        String forword = "";
   
     List <Book> list = null;
        list = bookService.findbylike(information,cs,price);
      
  if (list.size() != 0){
            msg = "相关书籍如下";
            ValueStack stack = ActionContext.getContext().getValueStack();
         
   stack.set("likeList",list);
            forword = "success";
        }
        else {
            msg = "非常抱歉，没有查询到任何结果。";
        
    forword = "error";
        }
        return forword;
    }

    public String FindInformation()
    {
    	System.out.println("显示图片的id："+book.getBookId());
    	
    	
    	book=bookService.findBookById(book.getBookId());
    	request.setAttribute("bookId", book.getBookId());
    	request.setAttribute("bookName", book.getBookName());
    	System.out.println("!!"+book.getBookName());
//    	request.setAttribute("bookPrice", book.getPrice());
    	return "success";

    }


	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
