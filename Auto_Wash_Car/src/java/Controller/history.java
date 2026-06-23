package Controller;

import DAO.BookingDAO;
import DAO.CustomerDAO;
import DTO.BookingDTO;
import DTO.CustomerDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class history extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("LOGIN_USER");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/MainController?action=loginPage");
            return;
        }

        CustomerDAO customerDAO = new CustomerDAO();
        CustomerDTO customer = customerDAO.getCustomerByUserId(user.getUserId());

        if (customer == null) {
            request.setAttribute("BOOKING_LIST", new ArrayList<BookingDTO>());
        } else {
            BookingDAO bookingDAO = new BookingDAO();
            ArrayList<BookingDTO> bookings = bookingDAO.getBookingsByCustomerId(customer.getCustomerId());
            request.setAttribute("BOOKING_LIST", bookings);
        }

        request.setAttribute("page", "history");
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}
