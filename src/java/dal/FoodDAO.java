/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Foods;

/**
 *
 * @author ai
 */
public class FoodDAO extends DBContext {

    private Connection con;
    public static FoodDAO INSTANCE = new FoodDAO();

    public FoodDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

    public List<Foods> getAllFood() {
        List<Foods> foodList = new Vector<>();
        String sql = "SELECT * FROM food_items";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                foodList.add(new Foods(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)
                ));
            }

        } catch (SQLException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return foodList;
    }

    public void updateFood(int id, String name, double price, String img) {
        String sql = "UPDATE food_items SET food_name = ?, price = ?, img = ? WHERE food_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, img);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteFood(int id) {
        String deleteOrdersSql = "DELETE FROM food_orders WHERE food_id = ?";
        String deleteEquipmentSql = "DELETE FROM food_items WHERE food_id = ?";

        try (PreparedStatement psOrders = con.prepareStatement(deleteOrdersSql); PreparedStatement psEquipment = con.prepareStatement(deleteEquipmentSql)) {
            psOrders.setInt(1, id);
            psOrders.executeUpdate();

            psEquipment.setInt(1, id);
            psEquipment.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(EquipmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void addFood(String name, double price, String img) {
        String sql = "INSERT INTO food_items (food_name, price, img) VALUES (?, ?, ?)";

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
