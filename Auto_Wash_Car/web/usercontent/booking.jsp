<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ServiceDTO"%>

<% ArrayList<ServiceDTO> serviceList = (ArrayList<ServiceDTO>) request.getAttribute("serviceList"); %>
<section class="content-box booking-box">
    <h1>Book a Car Wash</h1>
    <p class="form-note">Schedule your next premium wash.</p>
    <form action="booking" method="post">
        <div class="form-group">
            <label>Select Vehicle</label>
            <select name="vehicleId">
                <option>51A-99999 - Toyota Camry</option>
                <option>52B-12345 - Honda Civic</option>
            </select>
        </div>
        <div class="form-group">
            <label>Select Service</label>
            <select name="serviceId">
                <%
                    if (serviceList != null) {
                        for (ServiceDTO service : serviceList) {
                %>
                <option value="<%= service.getServiceId()%>">
                    <%= service.getServiceName()%> - <%= service.getPrice()%> VND
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label>Booking Date & Time</label>
            <input type="datetime-local"
                   name="bookingTime"
                   required>
        </div>
        <div class="form-group">
            <label>Notes</label>
            <textarea name="note"
                      rows="4"
                      placeholder="Additional requests..."></textarea>
        </div>
        <div class="booking-summary">
            <h2>Booking Summary</h2>
            <p>Tier: Gold Member</p>
            <p>Original Price: 250.000 VND</p>
            <p>Discount: 20%</p>
            <p class="final-price">
                Final Price: 200.000 VND
            </p>
        </div>
        <button type="submit">
            Confirm Booking
        </button>
    </form>
</section>
