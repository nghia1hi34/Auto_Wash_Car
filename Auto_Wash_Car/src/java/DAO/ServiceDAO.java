package DAO;

import DBUtils.DBUtils;
import DTO.ServiceDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ServiceDAO {

    public ArrayList<ServiceDTO> getServices() {
        ArrayList<ServiceDTO> result = new ArrayList<>();

        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            cn = DBUtils.getConnection();

            if (cn != null) {

                String sql = "SELECT service_id, service_name, price "
                        + "FROM Services "
                        + "WHERE status = 1";

                st = cn.prepareStatement(sql);

                rs = st.executeQuery();

                while (rs.next()) {

                    int serviceId = rs.getInt("service_id");
                    String serviceName = rs.getString("service_name");
                    double price = rs.getDouble("price");

                    ServiceDTO service = new ServiceDTO();

                    service.setServiceId(serviceId);
                    service.setServiceName(serviceName);
                    service.setPrice(price);

                    result.add(service);
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        } 
        return result;
    }
    public ServiceDTO getServiceById(int serviceId) {

    ServiceDTO service = null;

    try {
        Connection cn = DBUtils.getConnection();

        String sql = "SELECT * FROM Services WHERE service_id=?";

        PreparedStatement st = cn.prepareStatement(sql);

        st.setInt(1, serviceId);

        ResultSet rs = st.executeQuery();

        if(rs.next()){

            service = new ServiceDTO();

            service.setServiceId(rs.getInt("service_id"));
            service.setServiceName(rs.getString("service_name"));
            service.setPrice(rs.getDouble("price"));

        }

        cn.close();

    } catch(Exception e){
        e.printStackTrace();
    }

    return service;
}
}

    