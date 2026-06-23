<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="DTO.VehicleDTO"%>
<%@page import="DTO.ServiceDTO"%>
<%
    ArrayList<VehicleDTO> vehicles = (ArrayList<VehicleDTO>) request.getAttribute("LIST_VEHICLES");
    ArrayList<ServiceDTO> services = (ArrayList<ServiceDTO>) request.getAttribute("LIST_SERVICES");
    String selectedVehicleId = (String) request.getAttribute("SELECTED_VEHICLE_ID");
    String selectedServiceId = (String) request.getAttribute("SELECTED_SERVICE_ID");
    String bookingTime = (String) request.getAttribute("BOOKING_TIME");
    String note = (String) request.getAttribute("NOTE");
    BigDecimal originalPrice = (BigDecimal) request.getAttribute("ORIGINAL_PRICE");
    BigDecimal discountAmount = (BigDecimal) request.getAttribute("DISCOUNT_AMOUNT");
    BigDecimal finalPrice = (BigDecimal) request.getAttribute("FINAL_PRICE");
    Integer discountPercent = (Integer) request.getAttribute("DISCOUNT_PERCENT");

    if (vehicles == null) {
        vehicles = new ArrayList<>();
    }
    if (services == null) {
        services = new ArrayList<>();
    }

    if (selectedServiceId == null && services.size() > 0) {
        selectedServiceId = String.valueOf(services.get(0).getServiceId());
    }
    if (selectedVehicleId == null && vehicles.size() > 0) {
        selectedVehicleId = String.valueOf(vehicles.get(0).getVehicleId());
    }
%>
<section class="content-box booking-box">

    <h1>Book a Car Wash</h1>
    <p class="form-note">Schedule your next wash and confirm the price before checkout.</p>

    <p class="error-message">${requestScope.ERROR}</p>
    <p class="success-message">${requestScope.SUCCESS}</p>

    <form action="${pageContext.request.contextPath}/booking" method="post">
        <div class="form-group">
            <label>Select Vehicle</label>
            <select name="vehicleId" required>
                <%
                    for (VehicleDTO vehicle : vehicles) {
                        String value = String.valueOf(vehicle.getVehicleId());
                        String selected = value.equals(selectedVehicleId) ? "selected" : "";
                %>
                <option value="<%= value %>" <%= selected %>>
                    <%= vehicle.getLicensePlate() %> - <%= vehicle.getBrand() %> <%= vehicle.getModel() %>
                </option>
                <%
                    }
                    if (vehicles.isEmpty()) {
                %>
                <option value="">No vehicles available</option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label>Select Service</label>
            <select name="serviceId" required>
                <%
                    for (ServiceDTO service : services) {
                        String value = String.valueOf(service.getServiceId());
                        String selected = value.equals(selectedServiceId) ? "selected" : "";
                %>
                <option value="<%= value %>" <%= selected %>>
                    <%= service.getServiceName() %> - <%= service.getPrice() %> VND
                </option>
                <%
                    }
                    if (services.isEmpty()) {
                %>
                <option value="">No services available</option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label>Booking Date & Time</label>
            <input type="datetime-local" name="bookingTime" value="<%= bookingTime == null ? "" : bookingTime %>" required>
        </div>

        <div class="form-group">
            <label>Notes</label>
            <textarea name="note" rows="4" placeholder="Additional requests..."><%= note == null ? "" : note %></textarea>
        </div>

        <div class="booking-summary">
            <h2>Booking Summary</h2>
            <p>Tier discount: <%= discountPercent == null ? 0 : discountPercent %>%</p>
            <p>Original Price: <%= originalPrice == null ? "N/A" : originalPrice %> VND</p>
            <p>Discount: <%= discountAmount == null ? "N/A" : discountAmount %> VND</p>
            <p class="final-price">Final Price: <%= finalPrice == null ? "N/A" : finalPrice %> VND</p>
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
