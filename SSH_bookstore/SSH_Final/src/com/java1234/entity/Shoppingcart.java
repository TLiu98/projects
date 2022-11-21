package com.java1234.entity;

import java.io.Serializable;

import java.util.Objects;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.java1234.entity.ShoppingcartPK;
import com.java1234.entity.Shoppingcart;

@Entity
@Table(name="shoppingcart")
@IdClass(ShoppingcartPK.class)
/*实体类，使用复合主键必须实现Serializable接口*/  
public class Shoppingcart  implements Serializable{
    private String user_id;
    private String book_id;
    private int count;
    private String state;

    @Id
    @Column(name = "user_id")
    public String getUser_id() {return user_id;}
 	public void setUser_id(String user_id) {this.user_id = user_id;}

    @Id
    @Column(name = "book_id")
	public String getBook_id() {return book_id;}
	public void setBook_id(String book_id) {this.book_id = book_id;}

    @Basic
    @Column(name = "count")
    public int getCount() { return count;}
    public void setCount(int count) {this.count = count; }

    @Basic
    @Column(name = "state")
    public String getState() {return state;}

    public void setState(String state) { this.state = state; }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Shoppingcart that = (Shoppingcart) o;
        return count == that.count &&
                Objects.equals(user_id, that.user_id) &&
                Objects.equals(book_id, that.book_id) &&
                Objects.equals(state, that.state);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, book_id, count, state);
    }
    private HttpServletRequest request;

    public void setServletRequest(HttpServletRequest request) {
        // TODO Auto-generated method stub
        this.request=request;
    }
    public void getprice(double price){
        HttpSession session = request.getSession();
        double nowsum = (double)session.getAttribute("sumprice");
        double saleprice = (double)session.getAttribute("saleprice");
        session.setAttribute("sumprice",nowsum+price);
        session.setAttribute("saleprice",saleprice+price);
        return ;
    }

}
