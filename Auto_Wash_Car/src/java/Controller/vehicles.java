/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import DAO.VehicleDAO;
import DTO.CustomerDTO;
import DTO.UserDTO;
import DTO.VehicleDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author huynh
 */
@WebServlet(name = "vehicles", urlPatterns = {"/vehicles"})
public class vehicles extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            UserDTO loginUser = (UserDTO) request.getSession().getAttribute("LOGIN_USER");

            if (loginUser == null) {
                response.sendRedirect("MainController");
                return;
            }

            CustomerDAO customerDAO = new CustomerDAO();
            CustomerDTO customer = customerDAO.getCustomerByUserId(loginUser.getUserId());

            if (customer == null) {
                request.setAttribute("ERROR", "Customer profile was not found.");
                request.setAttribute("page", "vehicles");
                request.getRequestDispatcher("main.jsp").forward(request, response);
                return;
            }

            VehicleDAO vehicleDAO = new VehicleDAO();

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String action = request.getParameter("vehicleAction");

                if (action == null) {
                    action = request.getParameter("action");
                }

                if ("delete".equals(action)) {
                    deleteVehicle(request, customer.getCustomerId());
                } else if ("add".equals(action)) {
                    addVehicle(request, customer.getCustomerId());
                }
            }

            ArrayList<VehicleDTO> vehicles = vehicleDAO.getVehicles(customer.getCustomerId());
            request.setAttribute("LIST_VEHICLES", vehicles);
            request.setAttribute("page", "vehicles");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "System error. Please try again later.");
            request.setAttribute("page", "vehicles");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        }
    }

    private void addVehicle(HttpServletRequest request, int customerId) {
        try {
            String licensePlate = request.getParameter("licensePlate");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String color = request.getParameter("color");

            if (licensePlate != null) {
                licensePlate = licensePlate.trim();
            }
            if (brand != null) {
                brand = brand.trim();
            }
            if (model != null) {
                model = model.trim();
            }
            if (color != null) {
                color = color.trim();
            }

            if (licensePlate == null || licensePlate.length() == 0) {
                request.setAttribute("ERROR", "License plate is required.");
                return;
            }

            VehicleDTO vehicle = new VehicleDTO();
            vehicle.setCustomerId(customerId);
            vehicle.setLicensePlate(licensePlate);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setColor(color);

            VehicleDAO vehicleDAO = new VehicleDAO();
            int rows = vehicleDAO.addVehicle(vehicle);

            if (rows > 0) {
                request.setAttribute("SUCCESS", "Vehicle added successfully.");
            } else {
                request.setAttribute("ERROR", "Cannot add vehicle.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Cannot add vehicle. License plate may already exist.");
        }
    }

    private void deleteVehicle(HttpServletRequest request, int customerId) {
        try {
            String vehicleIdText = request.getParameter("vehicleId");

            if (vehicleIdText == null || vehicleIdText.trim().length() == 0) {
                request.setAttribute("ERROR", "Vehicle id is required.");
                return;
            }

            int vehicleId = Integer.parseInt(vehicleIdText.trim());
            VehicleDAO vehicleDAO = new VehicleDAO();
            int rows = vehicleDAO.deleteVehicle(vehicleId, customerId);

            if (rows > 0) {
                request.setAttribute("SUCCESS", "Vehicle deleted successfully.");
            } else {
                request.setAttribute("ERROR", "Cannot delete vehicle.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Cannot delete vehicle. This vehicle may already be used in bookings.");
        }
    }


    private String trim(String value) {
        if (value == null) {
            return null;
        }
        return value.trim();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Vehicle management";
    }
}
