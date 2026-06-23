<%@page import="java.util.ArrayList"%>
<%@page import="DTO.BookingDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<BookingDTO> bookings = (ArrayList<BookingDTO>) request.getAttribute("BOOKING_LIST");
    if (bookings == null) {
        bookings = new ArrayList<>();
    }

    String successMsg = (String) request.getAttribute("SUCCESS");
    String errorMsg = (String) request.getAttribute("ERROR");
%>
<section class="content-box history-page">
    <h1>Wash History</h1>
    <p class="form-note">
        Recent bookings and completed washes for
        ${empty sessionScope.LOGIN_USER.fullName ? "your account" : sessionScope.LOGIN_USER.fullName}.
    </p>

    <% if (successMsg != null && successMsg.length() > 0) { %>
        <div class="success-message"><%= successMsg %></div>
    <% } %>

    <% if (errorMsg != null && errorMsg.length() > 0) { %>
        <div class="error-message"><%= errorMsg %></div>
    <% } %>

    <% if (bookings.isEmpty()) { %>
        <div style="text-align:center;padding:48px;color:#718096;">
            <p style="font-size:18px;">No bookings yet.</p>
            <a href="MainController?action=booking" style="color:#3182ce;">Book your first car wash &rarr;</a>
        </div>
    <% } else { %>
        <table class="history-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date &amp; Time</th>
                    <th>Vehicle</th>
                    <th>Service</th>
                    <th>Original</th>
                    <th>Final Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% for (BookingDTO b : bookings) {
                    String status = b.getStatus() != null ? b.getStatus() : "PENDING";
                    String badgeClass = "badge-pending";
                    if ("CONFIRMED".equalsIgnoreCase(status)) {
                        badgeClass = "badge-confirmed";
                    } else if ("COMPLETED".equalsIgnoreCase(status)) {
                        badgeClass = "badge-completed";
                    } else if ("CANCELLED".equalsIgnoreCase(status)) {
                        badgeClass = "badge-cancelled";
                    }
                %>
                <tr>
                    <td>#<%= b.getBookingId() %></td>
                    <td><%= b.getBookingTime() %></td>
                    <td><%= b.getVehicleName() %></td>
                    <td><%= b.getServiceName() %></td>
                    <td><%= String.format("%,.0f", b.getOriginalPrice()) %> VND</td>
                    <td><strong><%= String.format("%,.0f", b.getFinalPrice()) %> VND</strong></td>
                    <td><span class="status-badge <%= badgeClass %>"><%= status %></span></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</section>
