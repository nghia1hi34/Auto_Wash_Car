/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import DAO.UserDAO;
import DTO.UserDTO;
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
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    /*
     * Xu ly dang ky tai khoan customer.
     * Luu y:
     * - register.jsp gui cac field: fullName, email, phone, password, confirmPassword.
     * - role khong lay tu form de tranh user tu chon ADMIN.
     * - User moi luon co role = CUSTOMER.
     * - Sau khi tao Users thanh cong, tao tiep Customers voi tier Member.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Lay data nguoi dung nhap tu form register.jsp.
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            // Trim de tranh loi user nhap du khoang trang dau/cuoi.
            if (fullName != null) {
                fullName = fullName.trim();
            }
            if (email != null) {
                email = email.trim();
            }
            if (phone != null) {
                phone = phone.trim();
            }

            // Kiem tra du lieu bat buoc.
            if (fullName == null || fullName.length() == 0
                    || email == null || email.length() == 0
                    || password == null || password.length() == 0
                    || confirmPassword == null || confirmPassword.length() == 0) {
                request.setAttribute("ERROR", "Please fill in all required fields.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Kiem tra password va confirm password co giong nhau khong.
            if (!password.equals(confirmPassword)) {
                request.setAttribute("ERROR", "Confirm password does not match.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            UserDAO userDAO = new UserDAO();

            // Kiem tra email da ton tai chua truoc khi insert.
            if (userDAO.isEmailExists(email)) {
                request.setAttribute("ERROR", "Email already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Tao object UserDTO de truyen xuong UserDAO.
            // createdAt va status khong can set vi database da co DEFAULT.
            UserDTO newUser = new UserDTO();
            newUser.setFullName(fullName);
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setRole("CUSTOMER");
            newUser.setPhone(phone);

            int newUserId = userDAO.createUser(newUser);

            if (newUserId == -1) {
                request.setAttribute("ERROR", "Cannot create user account.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            CustomerDAO customerDAO = new CustomerDAO();
            boolean createdCustomer = customerDAO.createCustomer(newUserId);

            if (!createdCustomer) {
                /*
                 * Luu y:
                 * - Truong hop nay hiem gap, thuong do thieu tier Member trong LoyaltyTiers.
                 * - User da tao roi nhung Customer tao that bai.
                 * - Sau nay co the cai tien bang transaction de rollback User neu Customer fail.
                 */
                request.setAttribute("ERROR", "Cannot create customer profile. Please check Member tier data.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Dang ky thanh cong thi chuyen sang login.jsp de user dang nhap.
            request.setAttribute("SUCCESS", "Register successfully. Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "System error. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    /*
     * Neu user go truc tiep /register bang GET,
     * chi can mo trang register.jsp, khong xu ly insert database.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    /*
     * Form register.jsp dung method="post",
     * nen logic dang ky chinh nam o doPost.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register customer account";
    }
}
