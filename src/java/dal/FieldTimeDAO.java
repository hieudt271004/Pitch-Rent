/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author ai
 */
public class FieldTimeDAO extends DBContext {

    private Connection con;
    public static FieldTimeDAO INSTANCE = new FieldTimeDAO();

    public FieldTimeDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(FieldTimeDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

    public List<FieldTime> getAllFieldTime() {
        List<FieldTime> fieldTimeList = new Vector<>();
        String sql = "SELECT * FROM field_time";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                fieldTimeList.add(new FieldTime(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5)
                ));
            }

        } catch (SQLException e) {
            Logger.getLogger(FieldTimeDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return fieldTimeList;
    }

    public List<Field> getAllFields() {
        List<Field> fields = new ArrayList<>();
        String sql = "SELECT field_id, field_name, location FROM fields";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int fieldId = rs.getInt("field_id");
                String fieldName = rs.getString("field_name");
                String location = rs.getString("location");

                Field field = new Field(fieldId, fieldName, location);
                fields.add(field);
            }

        } catch (SQLException e) {
            Logger.getLogger(FieldTimeDAO.class.getName()).log(Level.SEVERE, "Error fetching all fields", e);
        }

        return fields;
    }

    public void updateFieldTime(int fieldTimeId, String startTime, String endTime, double price) {
        String sql = "UPDATE field_time SET start_time = ?, end_time = ?, price = ? WHERE field_time_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, startTime);
            ps.setString(2, endTime);
            ps.setDouble(3, price);
            ps.setInt(4, fieldTimeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Error updating field time", e);
        }
    }

    public void deleteFieldTime(int fieldTimeId) {
        String deleteOrdersSql = "DELETE FROM field_orders WHERE field_time_id = ?";
        String deleteFieldTimeSql = "DELETE FROM field_time WHERE field_time_id = ?";
        String deleteFieldSql = "DELETE FROM fields WHERE field_id = (SELECT field_id FROM field_time WHERE field_time_id = ?)";

        try {
            // Delete from field_orders first (if any)
            try (PreparedStatement psOrders = con.prepareStatement(deleteOrdersSql)) {
                psOrders.setInt(1, fieldTimeId);
                psOrders.executeUpdate();
            }

            // Then delete from field_time
            try (PreparedStatement psFieldTime = con.prepareStatement(deleteFieldTimeSql)) {
                psFieldTime.setInt(1, fieldTimeId);
                psFieldTime.executeUpdate();
            }

            // Lastly delete from fields (if any)
            try (PreparedStatement psFields = con.prepareStatement(deleteFieldSql)) {
                psFields.setInt(1, fieldTimeId);
                psFields.executeUpdate();
            }

            System.out.println("Field time and related records deleted successfully.");

        } catch (SQLException e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Error deleting field time and related records", e);
        }
    }

    public void addFieldTime(int fieldId, String startTime, String endTime, double price) {
        String sql = "INSERT INTO field_time (field_id, start_time, end_time, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, fieldId);
            ps.setString(2, startTime);
            ps.setString(3, endTime);
            ps.setDouble(4, price);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Error adding field time", e);
        }
    }

}
