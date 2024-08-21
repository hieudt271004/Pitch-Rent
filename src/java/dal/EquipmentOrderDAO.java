/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.EquipmentOrder;

/**
 *
 * @author ai
 */
public class EquipmentOrderDAO extends DBContext {

    private Connection con;
    public static EquipmentOrderDAO INSTANCE = new EquipmentOrderDAO();

    public EquipmentOrderDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(EquipmentOrderDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

    public boolean insertEquipmentOrder(int customer_id, int equipment_id, int quantity, double total_amount) {
        String sql = "INSERT INTO equipment_orders (customer_id, equipment_id, quantity, order_date, total_amount) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customer_id);
            ps.setInt(2, equipment_id);
            ps.setInt(3, quantity);
            ps.setString(4, LocalDate.now().toString());
            ps.setDouble(5, total_amount);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            Logger.getLogger(EquipmentOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public List<EquipmentOrder> getHistoryEquipment(int customerid) {
        List<EquipmentOrder> getHistoryEquipment = new Vector<>();
        String sql = "  SELECT eo.equipment_order_id,e.equipment_name,eo.quantity,eo.order_date,eo.total_amount   \n"
                + "FROM \n"
                + "    dbo.equipment_orders eo\n"
                + "INNER JOIN \n"
                + "    dbo.equipment e ON eo.equipment_id = e.equipment_id\n"
                + "	where eo.customer_id = ? order by order_date desc";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    getHistoryEquipment.add(new EquipmentOrder(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getInt(5)
                    ));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(FieldTimeOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return getHistoryEquipment;
    }

}
