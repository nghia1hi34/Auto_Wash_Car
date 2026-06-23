/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    /*
     * Xu ly dang nhap.
     * Luu y:
     * - Form login.jsp dang gui input name="email" va name="password".
     * - Servlet se goi UserDAO.checkLogin() de kiem tra trong bang Users.
     * - Neu dang nhap dung, luu UserDTO vao session voi key "LOGIN_USER".
     * - Session giup cac trang khac nhu profile.jsp lay lai thong tin user.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Lay email va password nguoi dung nhap tu trang login.jsp.
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkLogin(email, password);

            if (user == null) {
                // Sai email/password hoac tai khoan khong ton tai.
                request.setAttribute("ERROR", "Email or password is invalid.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (user.isStatus()) {
                    // Luu user vao session de cac trang khac tai su dung.
                    request.getSession().setAttribute("LOGIN_USER", user);

                    // Dang nhap thanh cong thi chuyen den layout chinh cua user.
                    response.sendRedirect("MainController?action=dashboard");
                } else {
                    // Tai khoan ton tai nhung da bi khoa.
                    request.setAttribute("ERROR", "Access denied. Your account is inactive.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "System error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
         * Neu nguoi dung go truc tiep /login bang GET,
         * chi can mo trang login.jsp, khong xu ly dang nhap.
         */
        response.sendRedirect("MainController?action=loginPage");
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
        processRequest(request, response);
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
