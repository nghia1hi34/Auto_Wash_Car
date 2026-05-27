<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String currentPage = request.getParameter("page");
    String contentPage = "/usercontent/dashboard.jsp";
    String pageTitle = "Dashboard";

    if ("booking".equals(currentPage)) {
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
    } else if ("vehicles".equals(currentPage)) {
        contentPage = "/usercontent/vehicles.jsp";
        pageTitle = "Vehicles";
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
