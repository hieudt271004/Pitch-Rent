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
import model.FieldTimeOrder;
import model.HistoryBookingModel;

/**
 *
 * @author ai
 */
public class FieldTimeOrderDAO extends DBContext {

    private Connection con;
    public static FieldTimeOrderDAO INSTANCE = new FieldTimeOrderDAO();

    public FieldTimeOrderDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().connection;
            } catch (Exception e) {
                Logger.getLogger(FieldTimeOrderDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
            }
        }
    }

    public List<FieldTimeOrder> getFieldAllTimeByDay(String date) {
        List<FieldTimeOrder> fieldAllTimeByDay = new Vector<>();
        String sql = "SELECT field_time_id FROM field_orders WHERE CONVERT(date, order_date) = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, date);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    fieldAllTimeByDay.add(new FieldTimeOrder(rs.getInt(1)));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(FieldTimeOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return fieldAllTimeByDay;
    }

    public void insertFieldOrder(int customerId, int fieldTimeId,String date) {
        String sql = "INSERT INTO field_orders (customer_id, field_time_id, order_date) VALUES (?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ps.setInt(2, fieldTimeId);
            ps.setString(3, date);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(FieldTimeOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<HistoryBookingModel> getHistoryBooking(int customerid) {
        List<HistoryBookingModel> getHistoryBooking = new Vector<>();
        String sql = "SELECT f.field_name, ft.start_time, ft.end_time,ft.price,f.location,fo.order_date\n"
                + "FROM dbo.field_orders fo\n"
                + "JOIN dbo.field_time ft ON fo.field_time_id = ft.field_time_id\n"
                + "JOIN dbo.fields f ON ft.field_id = f.field_id\n"
                + "where customer_id =? order by fo.order_date";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    getHistoryBooking.add(new HistoryBookingModel(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getDouble(4),
                            rs.getString(5),
                            rs.getString(6)
                    ));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(FieldTimeOrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return getHistoryBooking;
    }

}
