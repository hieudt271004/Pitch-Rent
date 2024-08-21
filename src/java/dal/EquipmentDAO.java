/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Equipments;

/**
 *
 * @author ai
 */
public class EquipmentDAO extends DBContext {

    private Connection con;
    public static EquipmentDAO INSTANCE = new EquipmentDAO();

    public EquipmentDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

    public List<Equipments> getAllEquipment() {
        List<Equipments> equipmentList = new Vector<>();
        String sql = "SELECT * FROM equipment";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                equipmentList.add(new Equipments(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)
                ));
            }

        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return equipmentList;
    }

    public void updateEquipment(int equipmentId, String equipmentName, double price, String img) {
        String sql = "UPDATE equipment SET equipment_name = ?, price = ?, img = ? WHERE equipment_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, equipmentName);
            ps.setDouble(2, price);
            ps.setString(3, img);
            ps.setInt(4, equipmentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteEquipment(int equipmentId) {
        String deleteOrdersSql = "DELETE FROM equipment_orders WHERE equipment_id = ?";
        String deleteEquipmentSql = "DELETE FROM equipment WHERE equipment_id = ?";

        try (PreparedStatement psOrders = con.prepareStatement(deleteOrdersSql); PreparedStatement psEquipment = con.prepareStatement(deleteEquipmentSql)) {
            psOrders.setInt(1, equipmentId);
            psOrders.executeUpdate();

            psEquipment.setInt(1, equipmentId);
            psEquipment.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void addEquipment(String name, double price, String img) {
        String sql = "INSERT INTO equipment (equipment_name, price, img) VALUES (?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, img);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
