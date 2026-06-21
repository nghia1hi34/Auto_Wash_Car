/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class LoyaltyDAO {

    public double getDiscountPercent(int customerId) {

        double discount = 0;

        try {

            Connection cn = DBUtils.getConnection();

            String sql
                    = "SELECT lt.discount_percent "
                    + "FROM Customers c "
                    + "JOIN LoyaltyTiers lt "
                    + "ON c.tier_id = lt.tier_id "
                    + "WHERE c.customer_id = ?";

            PreparedStatement st
                    = cn.prepareStatement(sql);

            st.setInt(1, customerId);

            ResultSet rs
                    = st.executeQuery();

            if (rs.next()) {
                discount
                        = rs.getDouble("discount_percent");
            }

            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return discount;
    }
}