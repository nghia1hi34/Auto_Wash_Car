/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBUtils;
import DTO.UserDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author huynh
 */
public class UserDAO {

    /*
     * Kiem tra dang nhap.
     * Luu y:
     * - Lay ca tai khoan active va inactive de servlet co the hien thong bao dung.
     * - Dung PreparedStatement de tranh SQL injection.
     */
    public UserDTO checkLogin(String email, String password) {
        UserDTO result = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT user_id, full_name, email, password, role, phone, status, created_at "
                        + "FROM Users "
                        + "WHERE email = ? AND password = ?";

                st = cn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, password);
                table = st.executeQuery();

                if (table.next()) {
                    int userId = table.getInt("user_id");
                    String fullName = table.getString("full_name");
                    String userEmail = table.getString("email");
                    String userPassword = table.getString("password");
                    String role = table.getString("role");
                    String phone = table.getString("phone");
                    boolean status = table.getBoolean("status");
                    Date createdAt = table.getDate("created_at");

                    result = new UserDTO(userId, fullName, userEmail, userPassword,
                            role, phone, status, createdAt);
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
     * Kiem tra email da ton tai chua.
     * Luu y:
     * - Dung khi dang ky tai khoan moi.
     */
    public boolean isEmailExists(String email) {
        boolean result = false;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT user_id "
                        + "FROM Users "
                        + "WHERE email = ?";

                st = cn.prepareStatement(sql);
                st.setString(1, email);
                table = st.executeQuery();

                if (table.next()) {
                    result = true;
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
     * Tao user moi trong bang Users.
     * Luu y:
     * - Ham tra ve user_id vua tao de RegisterServlet co the tao tiep
     *   record trong bang Customers.
     * - Role khi dang ky customer nen truyen la "CUSTOMER".
     * - status va created_at khong insert vi database da co DEFAULT.
     */
    public int createUser(UserDTO user) {
        int result = -1;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "INSERT INTO Users (full_name, email, password, role, phone) "
                        + "OUTPUT INSERTED.user_id "
                        + "VALUES (?, ?, ?, ?, ?)";

                st = cn.prepareStatement(sql);
                st.setString(1, user.getFullName());
                st.setString(2, user.getEmail());
                st.setString(3, user.getPassword());
                st.setString(4, user.getRole());
                st.setString(5, user.getPhone());
                table = st.executeQuery();

                if (table.next()) {
                    result = table.getInt("user_id");
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
     * Lay thong tin user theo user_id.
     * Luu y:
     * - Dung cho profile hoac khi can load lai thong tin user tu session.
     * - Ham nay khong check password.
     */
    public UserDTO getUserById(int userId) {
        UserDTO result = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT user_id, full_name, email, password, role, phone, status, created_at "
                        + "FROM Users "
                        + "WHERE user_id = ?";

                st = cn.prepareStatement(sql);
                st.setInt(1, userId);
                table = st.executeQuery();

                if (table.next()) {
                    int id = table.getInt("user_id");
                    String fullName = table.getString("full_name");
                    String email = table.getString("email");
                    String password = table.getString("password");
                    String role = table.getString("role");
                    String phone = table.getString("phone");
                    boolean status = table.getBoolean("status");
                    Date createdAt = table.getDate("created_at");

                    result = new UserDTO(id, fullName, email, password,
                            role, phone, status, createdAt);
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
     * Dong ResultSet, PreparedStatement va Connection sau khi dung xong.
     * Luu y:
     * - Neu khong dong connection, ung dung co the bi day connection khi chay lau.
     * - Dong theo thu tu: ResultSet -> PreparedStatement -> Connection.
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
