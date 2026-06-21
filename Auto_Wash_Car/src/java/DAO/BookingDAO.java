/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBUtils;
import DTO.BookingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}