package com.java1234.action;
import com.java1234.entity.Book;
import com.java1234.entity.Shoppingcart;
import com.java1234.service.ShoppingcartService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ShoppingcartAction extends ActionSupport  implements ServletRequestAware {
	private Shoppingcart shoppingcart=new Shoppingcart();
    private String msg;
    private int num;
    @Resource(name="ShoppingcartService")
    private ShoppingcartService shoppingcartService;
    private HttpServletRequest request;
    private int isspecial;//是否特价
    private double specialprice;//特价
    private double sumprice;//非特价计算总价
    private double oneprice;//单价
    private int count;//个数
    private double saleprice;//特价计算总价

    public void setServletRequest(HttpServletRequest request) {
        // TODO Auto-generated method stub
        this.request=request;
    }
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
    
    
    //显示购物车
    @SuppressWarnings("unchecked")
	public String Shoppingcart()
    {
    	HttpSession session=request.getSession();	
    	if(session.getAttribute("userId")==null)
    	{ 
    		msg="请先登录";return ERROR;
    	}
    	else
    	{
    	 String userId=(String)session.getAttribute("userId");
    	 System.out.println("ID:"+userId);
    	 Map session1 = ActionContext.getContext().getSession();
        
    	 List<Shoppingcart> list = null;   //购物车列表
         list = shoppingcartService.Findlist(userId);
         System.out.println("购物车商品数量："+list.size());

         List<Book> list1 = new ArrayList<Book>();   //通过购物车list表 得到图书表
         list1 = shoppingcartService.findbyid(list);
         for (int i = 0; i < list.size(); i++) {
             session1.put("book"+i,list1.get(i));
             session1.put("shoppingcart"+i,list.get(i));   //将图书表和购物车表都放入Map session中
         }
         session.setAttribute("saleprice",0);
         session.setAttribute("sumprice",0);
         if (list.size() != 0 && list1.size() != 0){  //将表放入栈中
             ValueStack stack = ActionContext.getContext().getValueStack();
             stack.set("list",list);
             stack.set("list1",list1);
             session.setAttribute("list",list);    //购物车list
             session.setAttribute("list1",list1);    //图书表list1  都存放到session中，可供删除等方法使用
             msg = "查找成功！";
             return SUCCESS;
         }
         else
        	 return ERROR;  }
       }
      
    //插入到购物车
    public String InsertoShoppingcart(){	
    	HttpSession session=request.getSession();
    	if(session.getAttribute("userId")==null)
    	{ 
    		msg="请先登录";return ERROR;}
    	else
    	{
    		String userId=(String)session.getAttribute("userId");
    	    String bookId=request.getParameter("bookId");
    	    int num=Integer.parseInt(request.getParameter("num"));
    	    System.out.println("试图添加图书id:"+bookId+" 数量："+num);
            shoppingcart.setUser_id(userId);
            shoppingcart.setCount(num);
            shoppingcart.setBook_id(bookId);
        	try
        	{
        		if(shoppingcartService.insert(shoppingcart))
        		{ msg = "宝贝成功加入到购物车啦～";
        		  System.out.println("添加成功");
                  return SUCCESS;
        		}
        	}
        catch(Exception e){
            msg = "宝贝添加失败了！过一会儿再来或者试试别的宝贝吧！";
            System.out.println("添加失败");
           
            }
        	 return ERROR;
    	}
    }
        //购物车删除图书
    public String deletebook(){	
    	HttpSession session=request.getSession();	
    	if(session.getAttribute("userId")==null)
    	{ msg="请先登录"; return ERROR;
    	}
    	else
    	{
    		String user_id=(String)session.getAttribute("userId");
        	String book_id=request.getParameter("bookId");    //删除方法通过超链接传送一个参数bookId
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
    


	public Shoppingcart getShoppingcart() {
		return shoppingcart;
	}

	public void setShoppingcart(Shoppingcart shoppingcart) {
		this.shoppingcart = shoppingcart;
	}
    public String getPrice(){
        System.out.println(sumprice);
        if (isspecial == 1){
            saleprice += count*specialprice;
        }
        sumprice += count*oneprice;
        HttpSession session = request.getSession();
        session.setAttribute("saleprice",saleprice);
        session.setAttribute("sumprice",sumprice);
        return "success";
    }
	public int getIsspecial() {
		return isspecial;
	}
	public void setIsspecial(int isspecial) {
		this.isspecial = isspecial;
	}
	public double getSpecialprice() {
		return specialprice;
	}
	public void setSpecialprice(double specialprice) {
		this.specialprice = specialprice;
	}
	public double getSumprice() {
		return sumprice;
	}
	public void setSumprice(double sumprice) {
		this.sumprice = sumprice;
	}
	public double getOneprice() {
		return oneprice;
	}
	public void setOneprice(double oneprice) {
		this.oneprice = oneprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(double saleprice) {
		this.saleprice = saleprice;
	}
	public ShoppingcartService getShoppingcartService() {
		return shoppingcartService;
	}
	public void setShoppingcartService(ShoppingcartService shoppingcartService) {
		this.shoppingcartService = shoppingcartService;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


}
