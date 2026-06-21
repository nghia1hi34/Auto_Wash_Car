package DAO;

import DBUtils.DBUtils;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class BookingDAO {

    public int createBooking(int customerId, int vehicleId, int serviceId,
            Timestamp bookingTime, String note, BigDecimal originalPrice,
            int discountPercent, BigDecimal discountAmount, BigDecimal finalPrice) {
        int result = -1;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "INSERT INTO Bookings "
                        + "(customer_id, vehicle_id, service_id, booking_time, status, "
                        + "original_price, discount_percent, discount_amount, final_price, note) "
                        + "OUTPUT INSERTED.booking_id "
                        + "VALUES (?, ?, ?, ?, 'PENDING', ?, ?, ?, ?, ?)";

                st = cn.prepareStatement(sql);
                st.setInt(1, customerId);
                st.setInt(2, vehicleId);
                st.setInt(3, serviceId);
                st.setTimestamp(4, bookingTime);
                st.setBigDecimal(5, originalPrice);
                st.setInt(6, discountPercent);
                st.setBigDecimal(7, discountAmount);
                st.setBigDecimal(8, finalPrice);
                st.setString(9, note);

                table = st.executeQuery();

                if (table.next()) {
                    result = table.getInt("booking_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(table, st, cn);
        }

        return result;
    }

    private void closeResources(ResultSet table, PreparedStatement st, Connection cn) {
        try {
            if (table != null) {
                table.close();
            }
            if (st != null) {
                st.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
