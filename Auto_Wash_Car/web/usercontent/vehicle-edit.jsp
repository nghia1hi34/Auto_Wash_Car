<%@page import="DTO.VehicleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    VehicleDTO vehicle = (VehicleDTO) request.getAttribute("EDIT_VEHICLE");
%>

<section class="content-box booking-box">
    <h1>Edit Vehicle</h1>

    <p class="error-message">
        ${requestScope.ERROR}
    </p>

    <%
        if (vehicle == null) {
    %>
    <p class="form-note">
        Vehicle data was not found.
    </p>

    <form action="MainController" method="post" class="text-center">
        <input type="hidden" name="action" value="vehicles">
        <button type="submit">Back to Vehicles</button>
    </form>
    <%
    } else {
    %>
    <form action="MainController" method="post" class="vehicle-form">
        <input type="hidden" name="action" value="updateVehicle">
        <input type="hidden"
               name="vehicleId"
               value="<%= vehicle.getVehicleId()%>">

        <div class="form-group">
            <label>License plate</label>

            <input type="text"
                   name="licensePlate"
                   value="<%= vehicle.getLicensePlate() == null ? "" : vehicle.getLicensePlate()%>"
                   required>
        </div>

        <div class="form-grid">
            <div class="form-group">
                <label>Brand</label>

                <input type="text"
                       name="brand"
                       value="<%= vehicle.getBrand() == null ? "" : vehicle.getBrand()%>"
                       required>
            </div>

            <div class="form-group">
                <label>Model</label>

                <input type="text"
                       name="model"
                       value="<%= vehicle.getModel() == null ? "" : vehicle.getModel()%>"
                       required>
            </div>
        </div>

        <div class="form-group">
            <label>Color</label>

            <input type="text"
                   name="color"
                   value="<%= vehicle.getColor() == null ? "" : vehicle.getColor()%>"
                   required>
        </div>

        <button type="submit">
            Update Vehicle
        </button>
    </form>

    <form action="MainController" method="post" class="text-center">
        <input type="hidden" name="action" value="vehicles">
        <button type="submit">Cancel</button>
    </form>
    <%
        }
    %>
</section>
