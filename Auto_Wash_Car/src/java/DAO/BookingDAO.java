package DAO;

import DBUtils.DBUtils;
import DTO.BookingDTO;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BookingDAO {

    public ArrayList<BookingDTO> getBookingsByCustomerId(int customerId) {
        ArrayList<BookingDTO> result = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT b.booking_id, b.customer_id, b.vehicle_id, b.service_id, "
                        + "b.booking_time, b.original_price, b.final_price, b.discount_percent, "
                        + "b.discount_amount, b.note, b.status, "
                        + "v.license_plate, v.brand, v.model, "
                        + "s.service_name "
                        + "FROM Bookings b "
                        + "LEFT JOIN Vehicles v ON b.vehicle_id = v.vehicle_id "
                        + "LEFT JOIN Services s ON b.service_id = s.service_id "
                        + "WHERE b.customer_id = ? "
                        + "ORDER BY b.booking_time DESC";

                st = cn.prepareStatement(sql);
                st.setInt(1, customerId);
                table = st.executeQuery();

                while (table.next()) {
                    BookingDTO booking = new BookingDTO();
                    booking.setBookingId(table.getInt("booking_id"));
                    booking.setCustomerId(table.getInt("customer_id"));
                    booking.setVehicleId(table.getInt("vehicle_id"));
                    booking.setServiceId(table.getInt("service_id"));

                    Timestamp bookingTime = table.getTimestamp("booking_time");
                    if (bookingTime != null) {
                        booking.setBookingTime(bookingTime.toString());
                    }

                    BigDecimal originalPrice = table.getBigDecimal("original_price");
                    if (originalPrice != null) {
                        booking.setOriginalPrice(originalPrice.doubleValue());
                    }

                    BigDecimal finalPrice = table.getBigDecimal("final_price");
                    if (finalPrice != null) {
                        booking.setFinalPrice(finalPrice.doubleValue());
                    }

                    BigDecimal discountPercent = table.getBigDecimal("discount_percent");
                    if (discountPercent != null) {
                        booking.setDiscountPercent(discountPercent.doubleValue());
                    }

                    BigDecimal discountAmount = table.getBigDecimal("discount_amount");
                    if (discountAmount != null) {
                        booking.setDiscountAmount(discountAmount.doubleValue());
                    }

                    booking.setNote(table.getString("note"));
                    booking.setStatus(table.getString("status"));

                    String licensePlate = table.getString("license_plate");
                    String brand = table.getString("brand");
                    String model = table.getString("model");
                    String serviceName = table.getString("service_name");

                    if (licensePlate != null && brand != null && model != null) {
                        booking.setVehicleName(licensePlate + " - " + brand + " " + model);
                    } else {
                        booking.setVehicleName(licensePlate);
                    }
                    booking.setServiceName(serviceName);

                    result.add(booking);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(table, st, cn);
        }

        return result;
    }

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
