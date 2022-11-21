package com.java1234.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "book", schema = "javaee", catalog = "")
public class Book {
    private String bookId;
    private String bookName;
    private String picture;
    private Integer type;
    private Integer count;
    private Double price;
    private Double special_price;


	private String discription;
    private Integer isspecical;

    @Id
    @Column(name = "book_id")
    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    @Basic
    @Column(name = "book_name")
    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    @Basic
    @Column(name = "picture")
    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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
    @Column(name = "price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "special_price")
    public Double getSpecial_price() {
		return special_price;
	}

	public void setSpecial_price(Double special_price) {
		this.special_price = special_price;
	}

    @Basic
    @Column(name = "discription")
    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    @Basic
    @Column(name = "isspecical")
    public Integer getIsspecical() {
        return isspecical;
    }

    public void setIsspecical(Integer isspecical) {
        this.isspecical = isspecical;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book that = (Book) o;
        return Objects.equals(bookId, that.bookId) &&
                Objects.equals(bookName, that.bookName) &&
                Objects.equals(picture, that.picture) &&
                Objects.equals(type, that.type) &&
                Objects.equals(count, that.count) &&
                Objects.equals(price, that.price) &&
                Objects.equals(special_price, that.special_price) &&
                Objects.equals(discription, that.discription) &&
                Objects.equals(isspecical, that.isspecical);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookId, bookName, picture, type, count, price, special_price, discription, isspecical);
    }
}

