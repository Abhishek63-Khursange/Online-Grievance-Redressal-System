// File: com/ogrievance/dao/UserDao.java
package com.ogrievance.dao;

import com.ogrievance.dbutils.DBUtils;
import com.ogrievance.model.User;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public boolean registerUser(User user) {
        boolean result = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO users (name, email, password, phone, role) VALUES (?, ?, ?, ?, 'user')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());

            int i = ps.executeUpdate();
            if (i > 0) result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public String validateLogin(String email, String password) {
        String role = null;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT role FROM users WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
    
    
    public static User login(String email, String password) {
        User user = null;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));  // Very important!
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public static boolean deleteUser(int id) {
        boolean result = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "DELETE FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 // Fetch user details by ID
    public static User getUserById(int id) throws Exception {
        User user = null;
        Connection con = DBUtils.getConnection();
        String sql = "SELECT * FROM users WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            // Add other fields if necessary
        }

        rs.close();
        ps.close();
        con.close();
        return user;
    }

    public static User getUserById1(int id) {
        User user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean archiveDeletedUser(User user) {
        boolean success = false;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO deleted_users (id, name, email, role, deleted_at) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getRole());

            success = ps.executeUpdate() > 0;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    public static List<User> getAllDeletedUsers() {
        List<User> list = new ArrayList<>();
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM deleted_user ORDER BY deleted_at DESC")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setRole(rs.getString("role"));
                u.setDeletedAt(rs.getTimestamp("deleted_at").toString());
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    

}
