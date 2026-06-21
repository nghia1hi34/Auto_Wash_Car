<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.VehicleDTO, DTO.ServiceDTO, java.util.ArrayList"%>
<%
    ArrayList<VehicleDTO> vehicles = (ArrayList<VehicleDTO>) request.getAttribute("VEHICLE_LIST");
    ArrayList<ServiceDTO> services = (ArrayList<ServiceDTO>) request.getAttribute("SERVICE_LIST");
    Double discountPercent = (Double) request.getAttribute("DISCOUNT_PERCENT");
    if (discountPercent == null) discountPercent = 0.0;
%>
<section class="content-box booking-box">

    <h1>Book a Car Wash</h1>
    <p class="form-note">Schedule your next premium wash.</p>

    <% if (request.getSession().getAttribute("ERROR") != null) { %>
        <div class="alert alert-error">
            <%= request.getSession().getAttribute("ERROR") %>
        </div>
        <% request.getSession().removeAttribute("ERROR"); %>
    <% } %>

    <form action="booking" method="post">

        <div class="form-group">
            <label>Select Vehicle</label>
            <select name="vehicleId" required>
                <% if (vehicles != null && !vehicles.isEmpty()) {
                    for (VehicleDTO v : vehicles) { %>
                        <option value="<%= v.getVehicleId() %>">
                            <%= v.getLicensePlate() %> - <%= v.getBrand() %> <%= v.getModel() %>
                        </option>
                <% } } else { %>
                    <option value="">No vehicles registered</option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label>Select Service</label>
            <select name="serviceId" id="serviceSelect" required onchange="updatePrice()">
                <% if (services != null) {
                    for (ServiceDTO s : services) { %>
                        <option value="<%= s.getServiceId() %>"
                                data-price="<%= s.getPrice() %>">
                            <%= s.getServiceName() %> - <%= String.format("%,.0f", s.getPrice()) %> VND
                        </option>
                <% } } %>
            </select>
        </div>

        <div class="form-group">
            <label>Booking Date &amp; Time</label>
            <input type="datetime-local" name="bookingTime" required>
        </div>

        <div class="form-group">
            <label>Notes</label>
            <textarea name="note" rows="4"
                placeholder="Additional requests..."
                style="color:black"></textarea>
        </div>

        <div class="booking-summary">
            <h2>Booking Summary</h2>
            <p>Original price: <strong id="originalPrice">-</strong></p>
            <% if (discountPercent > 0) { %>
                <p>Membership discount: <strong><%= discountPercent.intValue() %>%</strong></p>
                <p>You save: <strong id="discountAmount" style="color:green">-</strong></p>
            <% } %>
            <p>Final price: <strong id="finalPrice">-</strong></p>
        </div>

        <button type="submit">Confirm Booking</button>

    </form>

</section>

<script>
    var discountPercent = <%= discountPercent %>;

    function updatePrice() {
        var select = document.getElementById('serviceSelect');
        var option = select.options[select.selectedIndex];
        var price = parseFloat(option.getAttribute('data-price')) || 0;
        var discount = price * discountPercent / 100;
        var finalPrice = price - discount;

        document.getElementById('originalPrice').textContent =
            price.toLocaleString('vi-VN') + ' VND';
        var discountEl = document.getElementById('discountAmount');
        if (discountEl) {
            discountEl.textContent = discount.toLocaleString('vi-VN') + ' VND';
        }
        document.getElementById('finalPrice').textContent =
            finalPrice.toLocaleString('vi-VN') + ' VND';
    }

    window.onload = updatePrice;
</script>
