/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Khoa
 */
import DBUtils.DBUtils;
import DTO.ServiceDTO;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ServiceDAO {
 public ArrayList<ServiceDTO> getServices() {
     ArrayList<ServiceDTO> result = new ArrayList<>();
      Connection cn = null;
      PreparedStatement st = null;
      ResultSet table = null;
      try {
         cn = DBUtils.getConnection();
         if (cn != null) {
           String sql =
                "SELECT service_id, service_name, description, "
               + "price, duration, status "
               + "FROM Services "
               + "WHERE status = 1";
                st = cn.prepareStatement(sql);
                table = st.executeQuery();
                while (table.next()) {
                   int serviceId = table.getInt("service_id");
                   String serviceName = table.getString("service_name");
                   String description = table.getString("description");
                   BigDecimal price = table.getBigDecimal("price");
                   int duration = table.getInt("duration");
                   boolean status = table.getBoolean("status");
                   ServiceDTO service = new ServiceDTO(
                         serviceId,
                         serviceName,
                         description,
                         price,
                         duration,
                         status
                  );
                 result.add(service);
              }
          }
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          closeResources(table, st, cn);
      }
      return result;
  }
  public ServiceDTO getServiceById(int serviceId) {
      ServiceDTO result = null;
      Connection cn = null;
      PreparedStatement st = null;
      ResultSet table = null;
      try{
          cn = DBUtils.getConnection();
          if (cn != null) {
           String sql =
                    "SELECT service_id, service_name, description, "
                  + "price, duration, status "
                  + "FROM Services "
                  + "WHERE service_id = ?";
             st = cn.prepareStatement(sql);
             st.setInt(1, serviceId);
             table = st.executeQuery();
             if (table.next()) {
                result = new ServiceDTO(
                        table.getInt("service_id"),
                        table.getString("service_name"),
                        table.getString("description"),
                        table.getBigDecimal("price"),
                        table.getInt("duration"),
                        table.getBoolean("status")
                 );
             }
         }
      } catch (Exception e) {
        e.printStackTrace();
    }finally{
     closeResources(table, st, cn);
    }
    return result;
  }
    private void closeResources(ResultSet table,
        PreparedStatement st,
        Connection cn) {
       try{
          if (table != null) {
              table.close();
           }
          if (st != null) {
              st.close();
           }
          if (cn != null) {
              cn.close();
           }
        }catch (Exception e) {         
          e.printStackTrace();
      }
   }
}