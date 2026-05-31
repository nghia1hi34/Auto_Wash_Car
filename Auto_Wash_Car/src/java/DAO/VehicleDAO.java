/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBUtils;
import DTO.VehicleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author huynh
 */
public class VehicleDAO {

    /*
     * Lay danh sach xe theo customer_id.
     */
    public ArrayList<VehicleDTO> getVehicles(int customerId) {
        ArrayList<VehicleDTO> result = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT vehicle_id, customer_id, model, brand, color, license_plate "
                        + "FROM Vehicles "
                        + "WHERE customer_id = ?";

                st = cn.prepareStatement(sql);
                st.setInt(1, customerId);
                table = st.executeQuery();

                while (table.next()) {
                    int vehicleId = table.getInt("vehicle_id");
                    int custId = table.getInt("customer_id");
                    String model = table.getString("model");
                    String brand = table.getString("brand");
                    String color = table.getString("color");
                    String licensePlate = table.getString("license_plate");

                    VehicleDTO vehicle = new VehicleDTO(vehicleId, custId, model,
                            brand, color, licensePlate);
                    result.add(vehicle);
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
     * Lay mot xe theo vehicle_id va customer_id de dam bao user chi sua xe cua minh.
     */
    public VehicleDTO getVehicleById(int vehicleId, int customerId) {
        VehicleDTO result = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "SELECT vehicle_id, customer_id, model, brand, color, license_plate "
                        + "FROM Vehicles "
                        + "WHERE vehicle_id = ? AND customer_id = ?";

                st = cn.prepareStatement(sql);
                st.setInt(1, vehicleId);
                st.setInt(2, customerId);
                table = st.executeQuery();

                if (table.next()) {
                    int id = table.getInt("vehicle_id");
                    int custId = table.getInt("customer_id");
                    String model = table.getString("model");
                    String brand = table.getString("brand");
                    String color = table.getString("color");
                    String licensePlate = table.getString("license_plate");

                    result = new VehicleDTO(id, custId, model, brand, color, licensePlate);
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
     * Cap nhat thong tin xe theo vehicle_id.
     */
    public int updateVehicle(int vehicleId, String licensePlate, String brand,
            String model, String color) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "UPDATE Vehicles "
                        + "SET license_plate = ?, brand = ?, model = ?, color = ? "
                        + "WHERE vehicle_id = ?";

                st = cn.prepareStatement(sql);
                st.setString(1, licensePlate);
                st.setString(2, brand);
                st.setString(3, model);
                st.setString(4, color);
                st.setInt(5, vehicleId);

                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, st, cn);
        }

        return result;
    }

    /*
     * Cap nhat xe cua customer dang dang nhap.
     */
    public int updateVehicle(int vehicleId, int customerId, String licensePlate,
            String brand, String model, String color) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "UPDATE Vehicles "
                        + "SET license_plate = ?, brand = ?, model = ?, color = ? "
                        + "WHERE vehicle_id = ? AND customer_id = ?";

                st = cn.prepareStatement(sql);
                st.setString(1, licensePlate);
                st.setString(2, brand);
                st.setString(3, model);
                st.setString(4, color);
                st.setInt(5, vehicleId);
                st.setInt(6, customerId);

                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, st, cn);
        }

        return result;
    }

    /*
     * Them xe moi cho customer dang dang nhap.
     */
    public int addVehicle(VehicleDTO vehicle) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "INSERT INTO Vehicles "
                        + "(customer_id, model, brand, color, license_plate) "
                        + "VALUES (?, ?, ?, ?, ?)";

                st = cn.prepareStatement(sql);
                st.setInt(1, vehicle.getCustomerId());
                st.setString(2, vehicle.getModel());
                st.setString(3, vehicle.getBrand());
                st.setString(4, vehicle.getColor());
                st.setString(5, vehicle.getLicensePlate());

                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, st, cn);
        }

        return result;
    }

    /*
     * Xoa xe cua customer dang dang nhap.
     */
    public int deleteVehicle(int vehicleId, int customerId) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {
                String sql = "DELETE FROM Vehicles "
                        + "WHERE vehicle_id = ? AND customer_id = ?";

                st = cn.prepareStatement(sql);
                st.setInt(1, vehicleId);
                st.setInt(2, customerId);

                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, st, cn);
        }

        return result;
    }

    /*
     * Ham tuong thich voi code cu neu servlet/JSP dang truyen id dang String.
     */
    public int updateCar(String id, String licensePlate, String brand,
            String model, String color) {
        int vehicleId = Integer.parseInt(id.trim());
        return updateVehicle(vehicleId, licensePlate, brand, model, color);
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
