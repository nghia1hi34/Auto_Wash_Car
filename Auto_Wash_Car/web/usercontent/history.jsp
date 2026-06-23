<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.BookingDTO, java.util.ArrayList"%>
<%
    ArrayList<BookingDTO> bookings = (ArrayList<BookingDTO>) request.getAttribute("BOOKING_LIST");
    String successMsg = (String) session.getAttribute("BOOKING_SUCCESS");
    if (successMsg != null) session.removeAttribute("BOOKING_SUCCESS");
    String errorMsg = (String) session.getAttribute("ERROR");
    if (errorMsg != null) session.removeAttribute("ERROR");
%>
<section class="content-box">

    <h1>Booking History</h1>

    <% if (successMsg != null) { %>
        <div style="background:#d4edda;color:#155724;padding:12px 16px;border-radius:6px;margin-bottom:16px;border:1px solid #c3e6cb;">
            ✓ <%= successMsg %>
        </div>
    <% } %>
    <% if (errorMsg != null) { %>
        <div style="background:#f8d7da;color:#721c24;padding:12px 16px;border-radius:6px;margin-bottom:16px;border:1px solid #f5c6cb;">
            <%= errorMsg %>
        </div>
    <% } %>

    <style>
        .history-table { width:100%; border-collapse:collapse; margin-top:8px; }
        .history-table th, .history-table td { padding:10px 12px; text-align:left; border-bottom:1px solid #e2e8f0; }
        .history-table th { background:#f7fafc; font-weight:600; font-size:13px; color:#4a5568; text-transform:uppercase; letter-spacing:.5px; }
        .history-table tr:hover td { background:#f9f9f9; }
        .status-badge { display:inline-block; padding:3px 10px; border-radius:12px; font-size:12px; font-weight:600; }
        .badge-pending  { background:#fff3cd; color:#856404; }
        .badge-confirmed { background:#cce5ff; color:#004085; }
        .badge-completed { background:#d4edda; color:#155724; }
        .badge-cancelled { background:#f8d7da; color:#721c24; }
    </style>

    <% if (bookings == null || bookings.isEmpty()) { %>
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
                    if ("CONFIRMED".equals(status))  badgeClass = "badge-confirmed";
                    else if ("COMPLETED".equals(status)) badgeClass = "badge-completed";
                    else if ("CANCELLED".equals(status)) badgeClass = "badge-cancelled";
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
