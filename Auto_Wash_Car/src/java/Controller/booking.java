package Controller;

import DAO.BookingDAO;
import DAO.CustomerDAO;
import DAO.ServiceDAO;
import DAO.VehicleDAO;
import DBUtils.DBUtils;
import DTO.CustomerDTO;
import DTO.ServiceDTO;
import DTO.UserDTO;
import DTO.VehicleDTO;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "booking", urlPatterns = {"/booking"})
public class booking extends HttpServlet {

    private static final String VIEW = "main.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        UserDTO loginUser = (UserDTO) request.getSession().getAttribute("LOGIN_USER");
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/MainController?action=loginPage");
            return;
        }

        CustomerDAO customerDAO = new CustomerDAO();
        CustomerDTO customer = customerDAO.getCustomerByUserId(loginUser.getUserId());
        if (customer == null) {
            request.setAttribute("ERROR", "Customer profile was not found.");
            loadPageData(request, null);
            request.setAttribute("page", "booking");
            request.getRequestDispatcher(VIEW).forward(request, response);
            return;
        }

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            handleBooking(request, response, loginUser, customer);
            return;
        }

        loadPageData(request, customer);
        request.setAttribute("page", "booking");
        request.getRequestDispatcher(VIEW).forward(request, response);
    }

    private void handleBooking(HttpServletRequest request, HttpServletResponse response,
            UserDTO loginUser, CustomerDTO customer) throws ServletException, IOException {
        try {
            String vehicleIdText = request.getParameter("vehicleId");
            String serviceIdText = request.getParameter("serviceId");
            String bookingTimeText = request.getParameter("bookingTime");
            String note = request.getParameter("note");

            Integer vehicleId = parseInt(vehicleIdText);
            Integer serviceId = parseInt(serviceIdText);
            if (vehicleId == null || serviceId == null || bookingTimeText == null || bookingTimeText.trim().isEmpty()) {
                request.setAttribute("ERROR", "Please fill in vehicle, service and booking time.");
                preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
                loadPageData(request, customer);
                request.setAttribute("page", "booking");
                request.getRequestDispatcher(VIEW).forward(request, response);
                return;
            }

            LocalDateTime bookingDateTime = LocalDateTime.parse(bookingTimeText.trim());
            if (bookingDateTime.isBefore(LocalDateTime.now())) {
                request.setAttribute("ERROR", "Booking time must be in the future.");
                preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
                loadPageData(request, customer);
                request.setAttribute("page", "booking");
                request.getRequestDispatcher(VIEW).forward(request, response);
                return;
            }

            VehicleDAO vehicleDAO = new VehicleDAO();
            VehicleDTO vehicle = vehicleDAO.getVehicleById(vehicleId, customer.getCustomerId());
            if (vehicle == null) {
                request.setAttribute("ERROR", "Selected vehicle is not available.");
                preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
                loadPageData(request, customer);
                request.setAttribute("page", "booking");
                request.getRequestDispatcher(VIEW).forward(request, response);
                return;
            }

            ServiceDAO serviceDAO = new ServiceDAO();
            ServiceDTO service = serviceDAO.getServiceById(serviceId);
            if (service == null) {
                request.setAttribute("ERROR", "Selected service is not available.");
                preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
                loadPageData(request, customer);
                request.setAttribute("page", "booking");
                request.getRequestDispatcher(VIEW).forward(request, response);
                return;
            }

            int discountPercent = getDiscountPercent(customer.getTierId());
            BigDecimal originalPrice = service.getPrice();
            BigDecimal discountAmount = originalPrice
                    .multiply(BigDecimal.valueOf(discountPercent))
                    .divide(BigDecimal.valueOf(100));
            BigDecimal finalPrice = originalPrice.subtract(discountAmount);

            BookingDAO bookingDAO = new BookingDAO();
            int bookingId = bookingDAO.createBooking(
                    customer.getCustomerId(),
                    vehicleId,
                    serviceId,
                    Timestamp.valueOf(bookingDateTime),
                    note,
                    originalPrice,
                    discountPercent,
                    discountAmount,
                    finalPrice);

            if (bookingId <= 0) {
                request.setAttribute("ERROR", "Cannot create booking.");
                preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
                loadPageData(request, customer);
                request.setAttribute("page", "booking");
                request.getRequestDispatcher(VIEW).forward(request, response);
                return;
            }

            request.setAttribute("SUCCESS", "Booking created successfully.");
            request.setAttribute("BOOKING_ID", bookingId);
            preserveSelection(request, vehicleIdText, serviceIdText, bookingTimeText, note);
            request.setAttribute("ORIGINAL_PRICE", originalPrice);
            request.setAttribute("DISCOUNT_PERCENT", discountPercent);
            request.setAttribute("DISCOUNT_AMOUNT", discountAmount);
            request.setAttribute("FINAL_PRICE", finalPrice);
            loadPageData(request, customer);
            request.setAttribute("page", "booking");
            request.getRequestDispatcher(VIEW).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Cannot create booking. Please check your input.");
            preserveSelection(request, request.getParameter("vehicleId"),
                    request.getParameter("serviceId"), request.getParameter("bookingTime"),
                    request.getParameter("note"));
            loadPageData(request, customer);
            request.setAttribute("page", "booking");
            request.getRequestDispatcher(VIEW).forward(request, response);
        }
    }

    private void loadPageData(HttpServletRequest request, CustomerDTO customer) {
        VehicleDAO vehicleDAO = new VehicleDAO();
        ServiceDAO serviceDAO = new ServiceDAO();

        ArrayList<VehicleDTO> vehicles = customer == null
                ? new ArrayList<VehicleDTO>()
                : vehicleDAO.getVehicles(customer.getCustomerId());
        ArrayList<ServiceDTO> services = serviceDAO.getActiveServices();

        request.setAttribute("LIST_VEHICLES", vehicles);
        request.setAttribute("LIST_SERVICES", services);

        if (customer != null) {
            int discountPercent = getDiscountPercent(customer.getTierId());
            request.setAttribute("CUSTOMER_TIER_ID", customer.getTierId());
            request.setAttribute("CUSTOMER_DISCOUNT_PERCENT", discountPercent);
        }

        if (request.getAttribute("SELECTED_SERVICE_ID") == null && !services.isEmpty()) {
            ServiceDTO firstService = services.get(0);
            request.setAttribute("SELECTED_SERVICE_ID", String.valueOf(firstService.getServiceId()));
            request.setAttribute("ORIGINAL_PRICE", firstService.getPrice());

            if (customer != null) {
                int discountPercent = getDiscountPercent(customer.getTierId());
                BigDecimal discountAmount = firstService.getPrice()
                        .multiply(BigDecimal.valueOf(discountPercent))
                        .divide(BigDecimal.valueOf(100));
                request.setAttribute("DISCOUNT_PERCENT", discountPercent);
                request.setAttribute("DISCOUNT_AMOUNT", discountAmount);
                request.setAttribute("FINAL_PRICE", firstService.getPrice().subtract(discountAmount));
            }
        }

        if (request.getAttribute("SELECTED_VEHICLE_ID") == null && !vehicles.isEmpty()) {
            request.setAttribute("SELECTED_VEHICLE_ID", String.valueOf(vehicles.get(0).getVehicleId()));
        }
    }

    private void preserveSelection(HttpServletRequest request, String vehicleIdText,
            String serviceIdText, String bookingTimeText, String note) {
        if (vehicleIdText != null) {
            request.setAttribute("SELECTED_VEHICLE_ID", vehicleIdText.trim());
        }
        if (serviceIdText != null) {
            request.setAttribute("SELECTED_SERVICE_ID", serviceIdText.trim());
        }
        if (bookingTimeText != null) {
            request.setAttribute("BOOKING_TIME", bookingTimeText.trim());
        }
        if (note != null) {
            request.setAttribute("NOTE", note);
        }
    }

    private Integer parseInt(String value) {
        try {
            if (value == null || value.trim().isEmpty()) {
                return null;
            }
            return Integer.valueOf(value.trim());
        } catch (Exception e) {
            return null;
        }
    }

    private int getDiscountPercent(int tierId) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet table = null;

        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT discount_percent FROM LoyaltyTiers WHERE tier_id = ?";
                st = cn.prepareStatement(sql);
                st.setInt(1, tierId);
                table = st.executeQuery();

                if (table.next()) {
                    result = table.getInt("discount_percent");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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

        return result;
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
}
