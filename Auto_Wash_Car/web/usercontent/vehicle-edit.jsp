<%@page import="DTO.VehicleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    VehicleDTO vehicle = (VehicleDTO) request.getAttribute("EDIT_VEHICLE");
%>

<section class="content-box booking-box vehicle-edit-box">
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

    <p class="text-center">
        <a href="vehicles">Back to Vehicles</a>
    </p>
    <%
    } else {
    %>
    <form action="vehicle-edit" method="post" class="vehicle-form">
        <input type="hidden"
               name="vehicleId"
               value="<%= vehicle.getVehicleId()%>">

        <div class="form-group">
            <label>License plate</label>

            <input type="text"
                   name="licensePlate"
                   required=""
                   value="<%= vehicle.getLicensePlate() == null ? "" : vehicle.getLicensePlate()%>"\>
        </div>

        <div class="form-grid">
            <div class="form-group">
                <label>Brand</label>

                <input type="text"
                       name="brand"
                       required=""
                       value="<%= vehicle.getBrand() == null ? "" : vehicle.getBrand()%>">
                       
            </div>

            <div class="form-group">
                <label>Model</label>

                <input type="text"
                       name="model"
                       required=""
                       value="<%= vehicle.getModel() == null ? "" : vehicle.getModel()%>">
            </div>
        </div>

        <div class="form-group">
            <label>Color</label>

            <input type="text"
                   name="color"
                   required=""
                   value="<%= vehicle.getColor() == null ? "" : vehicle.getColor()%>">
        </div>

        <button type="submit">
            Update Vehicle
        </button>

        <p class="text-center">
            <a href="vehicles">Cancel</a>
        </p>
    </form>
    <%
        }
    %>
</section>
