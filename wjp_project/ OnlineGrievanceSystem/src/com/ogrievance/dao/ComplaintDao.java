// File: com/ogrievance/dao/ComplaintDao.java
package com.ogrievance.dao;

import com.ogrievance.dbutils.DBUtils;
import com.ogrievance.model.Complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class ComplaintDao {

    public boolean submitComplaint(Complaint c) {
        boolean status = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO complaints (email, subject, category, description, status) VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getEmail());
            ps.setString(2, c.getSubject());
            ps.setString(3, c.getCategory());
            ps.setString(4, c.getDescription());

            int i = ps.executeUpdate();
            if (i > 0) status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static ArrayList<Complaint> getAllComplaints() {
        ArrayList<Complaint> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT * FROM complaints ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setEmail(rs.getString("email"));
                c.setSubject(rs.getString("subject"));
                c.setCategory(rs.getString("category"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
   
   
    public ArrayList<Complaint> getComplaintsByEmail(String email) {
        ArrayList<Complaint> list = new ArrayList<>();
        try (Connection con = DBUtils.getConnection()) {
            String sql = "SELECT * FROM complaints WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setEmail(rs.getString("email"));
                c.setSubject(rs.getString("subject"));
                c.setCategory(rs.getString("category"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static boolean saveComplaint(Complaint complaint) {
        boolean result = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO complaints(email, category, description, status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, complaint.getEmail());
            ps.setString(2, complaint.getCategory());
            ps.setString(3, complaint.getDescription());
            ps.setString(4, complaint.getStatus());

            int rows = ps.executeUpdate();
            result = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Complaint getComplaintById(int id) {
        Complaint c = null;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT * FROM complaints WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setEmail(rs.getString("email"));
                c.setCategory(rs.getString("category"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    
    public static List<Complaint> getAllComplaints1() {
        List<Complaint> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "SELECT * FROM complaints ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setEmail(rs.getString("email"));
                c.setCategory(rs.getString("category"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static boolean updateStatus(int complaintId, String newStatus) {
        boolean result = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "UPDATE complaints SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, complaintId);
            result = ps.executeUpdate() > 0;

            System.out.println("Complaint status updated: " + result + " (ID: " + complaintId + ", Status: " + newStatus + ")");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean deleteComplaintById(int id) {
        boolean result = false;
        try (Connection conn = DBUtils.getConnection()) {
            String sql = "DELETE FROM complaints WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }



	public static boolean updateStatus1(int complaintId, String newStatus) {
		// TODO Auto-generated method stub
		return false;
	}

    
}
