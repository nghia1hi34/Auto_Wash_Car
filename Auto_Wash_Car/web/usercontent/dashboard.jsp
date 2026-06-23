<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DTO.UserDTO loginUser = (DTO.UserDTO) session.getAttribute("LOGIN_USER");
    String fullName = loginUser != null ? loginUser.getFullName() : null;
    String role = loginUser != null ? loginUser.getRole() : null;
    String email = loginUser != null ? loginUser.getEmail() : null;
%>
<section class="content-box dashboard dashboard-page">
    <h1>Welcome to Auto Wash Pro</h1>
    <p class="form-note">Select a feature from your dashboard.</p>

    <div class="user-summary">
        <div class="summary-card">
            <h3>Signed in as</h3>
            <p><%= fullName == null || fullName.trim().isEmpty() ? "Guest" : fullName %></p>
        </div>

        <div class="summary-card">
            <h3>Role</h3>
            <p><%= role == null || role.trim().isEmpty() ? "Customer" : role %></p>
        </div>

        <div class="summary-card">
            <h3>Email</h3>
            <p><%= email == null || email.trim().isEmpty() ? "Not updated" : email %></p>
        </div>
    </div>

    <div class="dashboard-grid">
        <a href="MainController?action=booking" class="dashboard-card">
            <h2>Book Wash</h2>
            <p>Schedule your next wash</p>
        </a>

        <a href="MainController?action=history" class="dashboard-card">
            <h2>Wash History</h2>
            <p>View all previous washes</p>
        </a>

        <a href="MainController?action=rewards" class="dashboard-card">
            <h2>Rewards</h2>
            <p>Check points and benefits</p>
        </a>

        <a href="MainController?action=vehicles" class="dashboard-card">
            <h2>My Vehicles</h2>
            <p>Manage registered vehicles</p>
        </a>
    </div>
</section>
