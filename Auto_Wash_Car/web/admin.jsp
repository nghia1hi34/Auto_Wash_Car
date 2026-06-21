<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("LOGIN_USER") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    DTO.UserDTO loginUser = (DTO.UserDTO) session.getAttribute("LOGIN_USER");
    if (loginUser == null || !"ADMIN".equalsIgnoreCase(loginUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/main.jsp?page=dashboard");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Auto Wash Pro</title>
        <link rel="stylesheet" href="assets/css/style.css?v=3">
    </head>
    <body class="app-body">
        <%@include file="includes/app-header.jsp"%>

        <main class="app-content">
            <section class="content-box dashboard">
                <h1>Admin Dashboard</h1>
                <p class="form-note">Manage the Auto Wash Pro system from here.</p>

                <div class="user-summary">
                    <div class="summary-card">
                        <h3>Signed in as</h3>
                        <p><%= loginUser.getFullName() %></p>
                    </div>

                    <div class="summary-card">
                        <h3>Role</h3>
                        <p><%= loginUser.getRole() %></p>
                    </div>

                    <div class="summary-card">
                        <h3>Access</h3>
                        <p>Full system control</p>
                    </div>
                </div>

                <div class="dashboard-grid">
                    <a href="main.jsp?page=booking" class="dashboard-card">
                        <h2>Review Bookings</h2>
                        <p>Monitor customer purchase requests</p>
                    </a>

                    <a href="vehicles" class="dashboard-card">
                        <h2>Vehicles</h2>
                        <p>Inspect customer vehicle records</p>
                    </a>

                    <a href="main.jsp?page=history" class="dashboard-card">
                        <h2>History</h2>
                        <p>Review wash history records</p>
                    </a>

                    <a href="logout" class="dashboard-card">
                        <h2>Logout</h2>
                        <p>End admin session</p>
                    </a>
                </div>
            </section>
        </main>

        <%@include file="includes/app-footer.jsp"%>
    </body>
</html>
