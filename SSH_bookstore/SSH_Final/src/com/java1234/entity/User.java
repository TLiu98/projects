package com.java1234.entity;


import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
//import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="user")
//@MappedSuperclass
public class User {

	private String user_id;
	private String user_name;
	private String password;
	private String email;
	private String telephone;
	private String adress;

	@Id
	@GeneratedValue(generator = "uuidGenerator") //JPA通用策略生成器
	@GenericGenerator(name = "uuidGenerator", strategy = "uuid") //自定义主键
	@Column(name = "user_id", length=50)
	public String getUser_id() {return user_id;}
	public void setUser_id(String user_id) {this.user_id = user_id;}
	
	@Column(name = "user_name", length = 15)
	public String getUser_name() {return user_name;}
	public void setUser_name(String user_name) {this.user_name = user_name;}
	
	@Column(name = "password", length = 20)
	public String getPassword() {return password;}

	public void setPassword(String password) {this.password = password;}
	
	@Column(name = "email", length = 30)
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	
	@Column(name = "telephone", length = 15)
	public String getTelephone() {return telephone;}
	public void setTelephone(String telephone) {this.telephone = telephone;}
	
	@Column(name = "adress", length = 100)
	public String getAdress() {return adress;}
	public void setAdress(String adress) {this.adress = adress;}
	
	
}
