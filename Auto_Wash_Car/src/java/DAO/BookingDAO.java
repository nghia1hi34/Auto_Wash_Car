/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBUtils;
import DTO.BookingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class BookingDAO {

    public int createBooking(BookingDTO booking) {

        int result = 0;

        try {

            Connection cn = DBUtils.getConnection();

            String sql
                    = "INSERT INTO Bookings "
                    + "(customer_id,"
                    + "vehicle_id,"
                    + "service_id,"
                    + "booking_time,"
                    + "status,"
                    + "original_price,"
                    + "discount_percent,"
                    + "discount_amount,"
                    + "final_price,"
                    + "note) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = cn.prepareStatement(sql);

            st.setInt(1, booking.getCustomerId());

            st.setInt(2, booking.getVehicleId());

            st.setInt(3, booking.getServiceId());

            st.setString(4, booking.getBookingTime());

            st.setString(5, "PENDING");

            st.setDouble(6, booking.getOriginalPrice());

            st.setDouble(7, booking.getDiscountPercent());

            st.setDouble(8, booking.getDiscountAmount());

            st.setDouble(9, booking.getFinalPrice());

            st.setString(10, booking.getNote());

            result = st.executeUpdate();

            cn.close();

        } catch (Exception e) {
            System.out.println("BOOKING ERROR:");
            e.printStackTrace();

        }

        return result;
    }

    public ArrayList<BookingDTO> getBookingsByCustomerId(int customerId) {
        ArrayList<BookingDTO> result = new ArrayList<>();

        try {
            Connection cn = DBUtils.getConnection();

            String sql = "SELECT b.booking_id, b.vehicle_id, b.service_id, "
                    + "b.booking_time, b.status, b.original_price, "
                    + "b.discount_percent, b.discount_amount, b.final_price, b.note, "
                    + "v.license_plate, v.brand, v.model, s.service_name "
                    + "FROM Bookings b "
                    + "JOIN Vehicles v ON b.vehicle_id = v.vehicle_id "
                    + "JOIN Services s ON b.service_id = s.service_id "
                    + "WHERE b.customer_id = ? "
                    + "ORDER BY b.booking_time DESC";

            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                BookingDTO booking = new BookingDTO();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setVehicleId(rs.getInt("vehicle_id"));
                booking.setServiceId(rs.getInt("service_id"));
                booking.setBookingTime(rs.getString("booking_time"));
                booking.setStatus(rs.getString("status"));
                booking.setOriginalPrice(rs.getDouble("original_price"));
                booking.setDiscountPercent(rs.getDouble("discount_percent"));
                booking.setDiscountAmount(rs.getDouble("discount_amount"));
                booking.setFinalPrice(rs.getDouble("final_price"));
                booking.setNote(rs.getString("note"));

                String vehicleName = rs.getString("brand") + " "
                        + rs.getString("model") + " - "
                        + rs.getString("license_plate");
                booking.setVehicleName(vehicleName);
                booking.setServiceName(rs.getString("service_name"));

                result.add(booking);
            }

            cn.close();

        } catch (Exception e) {
            System.out.println("GET BOOKINGS ERROR:");
            e.printStackTrace();
        }

        return result;
    }
}