package com.java1234.action;

import java.util.HashMap;import net.sf.json.JSONObject;

import java.util.Map;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.java1234.entity.User;
import com.java1234.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.shao.Util.SendCode;

@Controller
public class UserAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;

	@Resource()
	private UserService userService;
	private User user;
	 private String msg;
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public User getUser() {return user;}
	public void setUser(User user) {this.user = user;}
    public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	private String checkCode;

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


	public String Login()throws Exception{
		System.out.println("用户尝试登录");
		HttpSession session=request.getSession();
		String checkCode2 = (String) session.getAttribute("checkCode");
		System.out.println("本次登录验证码："+checkCode2+"  用户填入的验证码"+checkCode);
		if (!checkCode.equals(checkCode2)) {
			System.out.println("登录失败：验证码错误");
			msg="验证码错误，请重新输入";
			return ERROR;
		}
		else
		{
		User currentUser=userService.findUserBy2(user);
		if(currentUser!=null){
			System.out.println("用户登录成功，"+currentUser.getUser_name());
			user.setUser_id(currentUser.getUser_id());
			session.setAttribute("currentUser", currentUser);
			session.setAttribute("userId",currentUser.getUser_id());
			return SUCCESS;
		}else{
			if((User)userService.findUserByName(user)!=null)
			{System.out.println("密码错误 ");
			msg="密码错误";}
			else
			{System.out.println("用户名不存在 ");
			msg="用户名不存在";}
			return ERROR;
		}
		}
	}
	public String Lost()throws Exception{
		System.out.println("用户尝试找回 ");
		HttpSession session=request.getSession();
//		System.out.println(user.getUser_name()+"~~"+user.getTelephone());
		User currentUser=userService.findUserByPhone(user);
		if(currentUser!=null){
			System.out.println("用户找回成功"+currentUser.getUser_name());
			user.setUser_id(currentUser.getUser_id());
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		}else{
			if((User)userService.findUserByName(user)!=null)
			{System.out.println("手机号错误");
			msg="手机号错误";}
			else
			{System.out.println("用户名不存在 ");
			msg="用户名不存在";}
			return ERROR;}
	}
	public String Register()throws Exception{	  
		if((User)userService.findUserByName(user)==null)
		{
			user.setUser_id(UUID.randomUUID().toString().replace("-",""));
		userService.saveUser(user);
		HttpSession session=request.getSession();
	    session.setAttribute("currentUser",user);
	    return SUCCESS;
		}
		else {msg="注册失败"; return ERROR;}
	}
	public String Logout() throws Exception
	{
		HttpSession session=request.getSession();
		session.setAttribute("currentUser", null);
	    return SUCCESS;
	}
	public String Update() throws Exception
	{
		
		HttpSession session=request.getSession();
		User user1=(User)session.getAttribute("currentUser");
		user.setUser_id(user1.getUser_id());
//		System.out.println("123 "+user.getUser_id()+"1"+user.getAddress());
		userService.updateUser(user);
		session.setAttribute("currentUser",user);
	    return SUCCESS;
	}
	public String Sms() throws Exception
	{

		System.out.println("发送短信验证");	    
		String phone=request.getParameter("phone");
		String rand=request.getParameter("rand");
//		System.out.println("");
		System.out.println("手机号"+phone);System.out.println("随机数"+rand);
//
		 Map<String,Object> map = new HashMap<String,Object>();
//					System.out.println(rand);
					try {
						SendCode.sendSms(phone,rand,"SMS_110470024");  
						 map.put("flag", "true");                    
					} 
					catch (Exception e) {
						// TODO Auto-generated catch block
						 map.put("flag", "false");
						e.printStackTrace();
					}
					JSONObject json = JSONObject.fromObject(map);
		             result = json.toString();
				
					return SUCCESS;
			}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
