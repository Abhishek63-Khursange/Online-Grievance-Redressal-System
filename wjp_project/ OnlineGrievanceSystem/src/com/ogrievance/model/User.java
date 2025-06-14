// File: com/ogrievance/model/User.java
package com.ogrievance.model;

public class User {
    private int id;         // ✅ Added ID field
    private String name;
    private String email;
    private String password;
    private String phone;
    private String role;
    private String deletedAt;


    // --- Getters ---
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public String getRole() {
        return role;
    }

    // --- Setters ---
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRole(String role) {
        this.role = role;
    }

	public void setDeletedAt(String string) {
		// TODO Auto-generated method stub
		
	}
	public String getDeletedAt() {
	    return deletedAt;
	}

	public void setDeletedAt1(String deletedAt) {
	    this.deletedAt = deletedAt;
	}

}
