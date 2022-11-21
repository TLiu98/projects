package com.java1234.entity;

	import javax.persistence.*;
	import java.util.Objects;

	@Entity
	@Table(name = "book_type", schema = "javaee", catalog = "")

public class BookType {
	    private int typeId;
	    private String typeName;

	    @Id
	    @Column(name = "type_id")
	    public int getTypeId() {
	        return typeId;
	    }

	    public void setTypeId(int typeId) {
	        this.typeId = typeId;
	    }

	    @Basic
	    @Column(name = "type_name")
	    public String getTypeName() {
	        return typeName;
	    }

	    public void setTypeName(String typeName) {
	        this.typeName = typeName;
	    }

	    @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;
	        BookType that = (BookType) o;
	        return typeId == that.typeId &&
	                Objects.equals(typeName, that.typeName);
	    }

	    @Override
	    public int hashCode() {
	        return Objects.hash(typeId, typeName);
	    }
	}
