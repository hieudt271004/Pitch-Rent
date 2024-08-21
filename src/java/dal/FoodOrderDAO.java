/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FoodOrder;

/**
 *
 * @author ai
 */
public class FoodOrderDAO extends DBContext {

    private Connection con;
    public static FoodOrderDAO INSTANCE = new FoodOrderDAO();

    public FoodOrderDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(FoodOrderDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

   public boolean insertFoodOrder(int customer_id, int food_id, int quantity, double total_amount) {
        String sql = "INSERT INTO food_orders (customer_id, food_id, quantity, total_amount, order_date) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customer_id);
            ps.setInt(2, food_id);
            ps.setInt(3, quantity);
            ps.setDouble(4, total_amount);
            ps.setString(5, LocalDate.now().toString());  // Insert current date

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            Logger.getLogger(FoodOrderDAO.class.getName()).log(Level.SEVERE, "Error inserting food order", e);
        }
        return false;
    }

    public List<FoodOrder> getHistoryFood(int customerid) {
        List<FoodOrder> getHistoryFood = new Vector<>();
        String sql = "  SELECT fo.food_order_id,fi.food_name,fo.quantity,fo.total_amount,fo.order_date\n"
                + "FROM food_orders AS fo\n"
                + "INNER JOIN food_items AS fi\n"
                + "ON fo.food_id = fi.food_id\n"
                + "where fo.customer_id =?\n"
                + "ORDER BY fo.order_date desc";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    getHistoryFood.add(new FoodOrder(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getString(5)
                    ));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(FoodOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return getHistoryFood;
    }

}
