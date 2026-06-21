/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.BookingDAO;
import DAO.CustomerDAO;
import DAO.LoyaltyDAO;
import DAO.ServiceDAO;
import DAO.VehicleDAO;
import DTO.BookingDTO;
import DTO.CustomerDTO;
import DTO.ServiceDTO;
import DTO.UserDTO;
import DTO.VehicleDTO;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class booking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet booking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet booking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDTO user = (UserDTO) request.getSession()
                .getAttribute("LOGIN_USER");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        CustomerDAO customerDAO = new CustomerDAO();
        CustomerDTO customer
                = customerDAO.getCustomerByUserId(
                        user.getUserId());

        VehicleDAO vehicleDAO = new VehicleDAO();
        ArrayList<VehicleDTO> vehicles
                = vehicleDAO.getVehicles(
                        customer.getCustomerId());

        ServiceDAO serviceDAO = new ServiceDAO();
        ArrayList<ServiceDTO> services
                = serviceDAO.getServices();
        LoyaltyDAO loyaltyDAO = new LoyaltyDAO();

        double discountPercent
                = loyaltyDAO.getDiscountPercent(
                        customer.getCustomerId());

        request.setAttribute("DISCOUNT_PERCENT", discountPercent);
        request.setAttribute("VEHICLE_LIST", vehicles);
        request.setAttribute("SERVICE_LIST", services);
        request.setAttribute("page", "booking");

        request.getRequestDispatcher("main.jsp")
                .forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            UserDTO user
                    = (UserDTO) request.getSession()
                            .getAttribute("LOGIN_USER");

            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            CustomerDAO customerDAO
                    = new CustomerDAO();

            CustomerDTO customer
                    = customerDAO.getCustomerByUserId(
                            user.getUserId());

            if (customer == null) {
                response.sendRedirect("main.jsp?page=booking");
                return;
            }

            int customerId
                    = customer.getCustomerId();

            int vehicleId
                    = Integer.parseInt(
                            request.getParameter("vehicleId"));

            int serviceId
                    = Integer.parseInt(
                            request.getParameter("serviceId"));

            String bookingTime = request.getParameter("bookingTime").replace("T", " ") + ":00";

            String note
                    = request.getParameter("note");

            ServiceDAO serviceDAO
                    = new ServiceDAO();

            ServiceDTO service
                    = serviceDAO.getServiceById(serviceId);

            if (service == null) {

                request.setAttribute("ERROR",
                        "Service not found");

                request.getRequestDispatcher(
                        "main.jsp?page=booking")
                        .forward(request, response);

                return;
            }

            LoyaltyDAO loyaltyDAO
                    = new LoyaltyDAO();

            double discountPercent
                    = loyaltyDAO.getDiscountPercent(
                            customerId);

            double originalPrice
                    = service.getPrice();

            double discountAmount
                    = originalPrice
                    * discountPercent
                    / 100;

            double finalPrice
                    = originalPrice
                    - discountAmount;

            BookingDTO booking
                    = new BookingDTO();

            booking.setCustomerId(customerId);

            booking.setVehicleId(vehicleId);

            booking.setServiceId(serviceId);

            booking.setBookingTime(bookingTime);

            booking.setNote(note);

            booking.setOriginalPrice(originalPrice);

            booking.setDiscountPercent(
                    discountPercent);

            booking.setDiscountAmount(
                    discountAmount);

            booking.setFinalPrice(
                    finalPrice);

            BookingDAO dao
                    = new BookingDAO();

            int result
                    = dao.createBooking(booking);

            if (result > 0) {
                request.getSession().setAttribute("BOOKING_SUCCESS", "Booking confirmed successfully!");
            } else {
                request.getSession().setAttribute("ERROR", "Booking failed!");
            }

            response.sendRedirect("history");

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "ERROR",
                            "System error!");

            response.sendRedirect(
                    "main.jsp?page=booking");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}