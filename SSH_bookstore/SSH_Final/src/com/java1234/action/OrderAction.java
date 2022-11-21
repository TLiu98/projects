package com.java1234.action;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.java1234.entity.Book;
import com.java1234.entity.Orders1Entity;
import com.java1234.entity.Shoppingcart;
import com.java1234.entity.User;
import com.java1234.service.OrderService;
import com.java1234.service.ShoppingcartService;
import com.java1234.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

@Controller
public class OrderAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;

	@Resource()
	private OrderService orderService;
    @Resource(name="ShoppingcartService")
    private ShoppingcartService shoppingcartService;
	private Orders1Entity order;
	private User user;
	private String msg;
	 public Orders1Entity getOrder() {return order;}
	public void setOrder(Orders1Entity order) {this.order = order;}
	public User getUser() {return user;}
	public void setUser(User user) {this.user = user;}
	public String getChoice() {return choice;}
	public void setChoice(String choice) {this.choice = choice;}
	private String choice;
    public String getMsg() {return msg;}
	public void setMsg(String msg) {
		this.msg = msg;
	}


	 public String InserttoOrder(){
	        String forword = "";
	        HttpSession session = request.getSession();
	        ArrayList<Shoppingcart> list = (ArrayList) session.getAttribute("list");
	        ArrayList<Book> list1 = (ArrayList) session.getAttribute("list1");
	        Orders1Entity order1 = new Orders1Entity();
	        user = (User) session.getAttribute("currentUser");
	        int flag1 = 0;
	        System.out.println(choice);
	        for (int i = 1; i < choice.length()-1; i++){//传过来的值是'012',所以从1开始，到length-1结束
	            //int j = choice.charAt(i)-48;
	            String str = String.valueOf(choice.charAt(i));
	            int j = Integer.parseInt(str);
	            System.out.println(j);
	            order1.setOrderId(UUID.randomUUID().toString().replace("-",""));
	            order1.setBookId(list1.get(j).getBookId());
//	            System.out.println(user.getTelephone());
	            order1.setTelephone(user.getTelephone());
	            order1.setAdress(user.getAdress());
//	            System.out.println(user.getAdress());s
	            order1.setCount(list.get(j).getCount());
	            order1.setUserId(user.getUser_id());
	            order1.setStatus(0);
	            String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( new Date());
	            order1.setTimee(current);

	            order1.setPrice(list.get(j).getCount()*list1.get(j).getPrice());
	           
	            orderService.insertintoorder(order1);
	            
	            deletebook(list1.get(j).getBookId());
	            	
	  
	        }
	            msg = "订单已经生成！";
	            return "success";
	    }
	    public String FindAllOrder(){
	        String forword = "";
	        User user1 = new User();
	        HttpSession session = request.getSession();
	        user1 = (User)session.getAttribute("currentUser");
	        List<Orders1Entity> list = new ArrayList<Orders1Entity>();
	        list = orderService.findallorder(user1);

	        ValueStack stack = ActionContext.getContext().getValueStack();
	        stack.set("orderlist",list);
	        //session.setAttribute("orderlist",list);
	        if (list.size() != 0){
	            msg = "您的宝贝订单信息如下：";
	            forword = "success";
	        }
	        else{
	            msg = "暂时没有订单信息哦~快去下单吧！!";
	            forword = "fail";
	        }
	        return forword;
	    }
	    
        //购物车删除图书
    public String deletebook(String book_id){	
    	HttpSession session=request.getSession();	
    	if(session.getAttribute("userId")==null)
    	{ msg="请先登录"; return ERROR;
    	}
    	else
    	{
    		String user_id=(String)session.getAttribute("userId");
  		    Shoppingcart sp1=null;
  		    System.out.println("试图删除bookId"+book_id);
  			String hql="from Shoppingcart s  where s.user_id =? and s.book_id =?";
  						sp1=shoppingcartService.findshoppingcart(user_id, book_id);//通过userid和bookid获得一个shoppingcart对象
        	try
        	{ 	
        		if(shoppingcartService.detelebook(sp1))
        		{
        			 System.out.println("删除成功");
        			 msg="删除成功";
        			 ArrayList<Shoppingcart> list = (ArrayList) session.getAttribute("list");
                     ArrayList<Shoppingcart> list1 = (ArrayList) session.getAttribute("list1");
                     int x = list.indexOf(sp1);
                     list.remove(x);//在购物车list中删除这条记录
                     list1.remove(x);//在图书表list1中删除记录
                     session.setAttribute("list",list);
                     session.setAttribute("list1",list1);
                return SUCCESS;
        		}
                else return ERROR;

        	}
        	   catch(Exception e){
                   msg = "宝贝删除失败了";
                   return ERROR;}
               
           	}
        		
        	
    	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
