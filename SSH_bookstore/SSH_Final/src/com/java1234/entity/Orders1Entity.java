package com.java1234.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "orders1", schema = "javaee", catalog = "")
public class Orders1Entity {
    private String orderId;
    private String bookId;
    private Integer count;
    private String adress;
    private String telephone;
    private Integer status;
    private String userId;
    private Double price;
    private String timee;

    @Id
    @Column(name = "order_id")
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "book_id")
    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    @Basic
    @Column(name = "count")
    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Basic
    @Column(name = "adress")
    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    @Basic
    @Column(name = "telephone")
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Basic
    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Basic
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "Timee")
    public String getTimee() {
        return timee;
    }

    public void setTimee(String timee) {
        this.timee = timee;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Orders1Entity that = (Orders1Entity) o;
        return Objects.equals(orderId, that.orderId) &&
                Objects.equals(bookId, that.bookId) &&
                Objects.equals(count, that.count) &&
                Objects.equals(adress, that.adress) &&
                Objects.equals(telephone, that.telephone) &&
                Objects.equals(status, that.status) &&
                Objects.equals(userId, that.userId) &&
                Objects.equals(price, that.price) &&
                Objects.equals(timee, that.timee);
    }

    @Override
    public int hashCode() {
        return Objects.hash(orderId, bookId, count, adress, telephone, status, userId, price, timee);
    }
}
