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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author huynh
 */
@WebServlet(name = "vehicleEdit", urlPatterns = {"/vehicle-edit"})
public class vehicleEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            UserDTO loginUser = (UserDTO) request.getSession().getAttribute("LOGIN_USER");

            if (loginUser == null) {
                response.sendRedirect("MainController?action=loginPage");
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
                updateVehicle(request, response, vehicleDAO, customer.getCustomerId());
                return;
            }

            String vehicleIdText = request.getParameter("vehicleId");
            if (vehicleIdText == null || vehicleIdText.trim().isEmpty()) {
                request.setAttribute("ERROR", "Vehicle id is required.");
                request.setAttribute("page", "vehicle-edit");
                request.getRequestDispatcher("main.jsp").forward(request, response);
                return;
            }

            int vehicleId = Integer.parseInt(vehicleIdText.trim());
            VehicleDTO vehicle = vehicleDAO.getVehicleById(vehicleId, customer.getCustomerId());

            if (vehicle == null) {
                request.setAttribute("ERROR", "Vehicle was not found.");
            } else {
                request.setAttribute("EDIT_VEHICLE", vehicle);
            }

            request.setAttribute("page", "vehicle-edit");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "System error. Please try again later.");
            request.setAttribute("page", "vehicle-edit");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        }
    }

    private void updateVehicle(HttpServletRequest request, HttpServletResponse response,
            VehicleDAO vehicleDAO, int customerId) throws ServletException, IOException {
        try {
            String vehicleIdText = request.getParameter("vehicleId");
            String licensePlate = trim(request.getParameter("licensePlate"));
            String brand = trim(request.getParameter("brand"));
            String model = trim(request.getParameter("model"));
            String color = trim(request.getParameter("color"));

            if (vehicleIdText == null || vehicleIdText.trim().isEmpty()) {
                request.setAttribute("ERROR", "Vehicle id is required.");
                request.setAttribute("page", "vehicle-edit");
                request.getRequestDispatcher("main.jsp").forward(request, response);
                return;
            }

            if (licensePlate == null || licensePlate.isEmpty()) {
                request.setAttribute("ERROR", "License plate is required.");
                request.setAttribute("page", "vehicle-edit");
                request.getRequestDispatcher("main.jsp").forward(request, response);
                return;
            }

            int vehicleId = Integer.parseInt(vehicleIdText.trim());
            int rows = vehicleDAO.updateVehicle(vehicleId, customerId, licensePlate, brand, model, color);

            if (rows > 0) {
                response.sendRedirect("vehicles");
            } else {
                request.setAttribute("ERROR", "Cannot update vehicle.");
                request.setAttribute("EDIT_VEHICLE", vehicleDAO.getVehicleById(vehicleId, customerId));
                request.setAttribute("page", "vehicle-edit");
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Cannot update vehicle. License plate may already exist.");
            request.setAttribute("page", "vehicle-edit");
            request.getRequestDispatcher("main.jsp").forward(request, response);
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
        return "Vehicle edit";
    }
}
