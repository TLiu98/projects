package com.java1234.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class ShoppingcartPK implements Serializable {
    private String user_id;
    private String book_id;

    @Column(name = "user_id")
    @Id
    public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
    @Column(name = "book_id")
    @Id
	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShoppingcartPK that = (ShoppingcartPK) o;
        return Objects.equals(user_id, that.user_id) &&
                Objects.equals(book_id, that.book_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, book_id);
    }
}
