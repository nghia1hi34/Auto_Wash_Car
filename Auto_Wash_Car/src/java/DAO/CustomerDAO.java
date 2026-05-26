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
 * @author huynh
 */
public class CustomerDAO {

    /*
     * Lay tier_id cua hang Member.
     * Luu y:
     * - Khi user dang ky moi, customer se mac dinh thuoc hang Member.
     * - Database can co san dong LoyaltyTiers voi tier_name = 'Member'.
     * - Neu chua co tier Member, ham se tra ve -1 va khong nen tao Customer.
     */
    public int getMemberTierId() {
        int result = -1;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT tier_id "
                        + "FROM LoyaltyTiers "
                        + "WHERE tier_name = ?";

                st = cn.prepareStatement(sql);
                st.setString(1, "Member");
                table = st.executeQuery();

                if (table.next()) {
                    result = table.getInt("tier_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(table, st, cn);
        }

        return result;
    }

    /*
     * Tao thong tin Customer sau khi tao User thanh cong.
     * Luu y:
     * - user_id lay tu Users vua insert.
     * - tier_id mac dinh la Member.
     * - points, total_washes, total_spending de 0 cho tai khoan moi.
     */
    public boolean createCustomer(int userId) {
        boolean result = false;
        Connection cn = null;
        PreparedStatement st = null;

        try {
            int memberTierId = getMemberTierId();

            if (memberTierId == -1) {
                return false;
            }

            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "INSERT INTO Customers "
                        + "(user_id, tier_id, points, total_washes, total_spending) "
                        + "VALUES (?, ?, 0, 0, 0)";

                st = cn.prepareStatement(sql);
                st.setInt(1, userId);
                st.setInt(2, memberTierId);

                int rows = st.executeUpdate();

                if (rows > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, st, cn);
        }

        return result;
    }

    /*
     * Dong ResultSet, PreparedStatement va Connection sau khi dung xong.
     * Luu y:
     * - Dong connection de tranh ton tai ket noi mo qua lau.
     * - Neu ResultSet khong dung thi truyen null.
     */
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
