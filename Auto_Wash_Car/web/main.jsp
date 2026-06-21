<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ServiceDAO"%>
<%
    /*
     * Security note:
     * - main.jsp la trang sau dang nhap, nen bat buoc phai co LOGIN_USER trong session.
     * - Neu user go truc tiep /main.jsp hoac /main.jsp?page=... khi chua login,
     *   chuyen ve login.jsp de tranh bypass man hinh dang nhap.
     */
    if (session.getAttribute("LOGIN_USER") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String currentPage = request.getParameter("page");
    if (currentPage == null && request.getAttribute("page") != null) {
        currentPage = request.getAttribute("page").toString();
    }
    String contentPage = "/usercontent/dashboard.jsp";
    String pageTitle = "Dashboard";
/*phan moi duoc sua*/
   if ("booking".equals(currentPage)) {
        ServiceDAO dao = new ServiceDAO();
        request.setAttribute("serviceList",dao.getServices());
        contentPage = "/usercontent/booking.jsp";
        pageTitle = "Booking";
} else if ("history".equals(currentPage)) {
        contentPage = "/usercontent/history.jsp";
        pageTitle = "History";
    } else if ("rewards".equals(currentPage)) {
        contentPage = "/usercontent/rewards.jsp";
        pageTitle = "Rewards";
    } else if ("profile".equals(currentPage)) {
        contentPage = "/usercontent/profile.jsp";
        pageTitle = "Profile";
    } else if ("profile-edit".equals(currentPage)) {
        contentPage = "/usercontent/profile-edit.jsp";
        pageTitle = "Edit Profile";
    } else if ("profile-security".equals(currentPage)) {
        contentPage = "/usercontent/profile-security.jsp";
        pageTitle = "Profile Security";
    } else if ("vehicles".equals(currentPage)) {
        contentPage = "/usercontent/vehicles.jsp";
        pageTitle = "Vehicles";
    } else if ("vehicle-edit".equals(currentPage)) {
        contentPage = "/usercontent/vehicle-edit.jsp";
        pageTitle = "Edit Vehicle";
    } else {
        currentPage = "dashboard";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= pageTitle%> - Auto Wash Pro</title>
        <link rel="stylesheet" href="assets/css/style.css?v=3">
    </head>
    <body class="app-body">
        <%@include file="includes/app-header.jsp"%>
        <%@include file="includes/app-menu.jsp"%>

        <main class="app-content">
            <%
                request.getRequestDispatcher(contentPage).include(request, response);
            %>
        </main>

        <%@include file="includes/app-footer.jsp"%>

        <script>
            const themeToggle = document.getElementById("themeToggle");
            const savedTheme = localStorage.getItem("autowash-theme");

            if (savedTheme === "dark") {
                document.body.classList.add("dark-mode");
            }

            themeToggle.addEventListener("click", function () {
                document.body.classList.toggle("dark-mode");
                localStorage.setItem(
                        "autowash-theme",
                        document.body.classList.contains("dark-mode") ? "dark" : "light"
                        );
            });
        </script>
    </body>
</html>
