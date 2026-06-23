<%@page import="java.util.ArrayList"%>
<%@page import="DTO.VehicleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<VehicleDTO> vehicles = (ArrayList<VehicleDTO>) request.getAttribute("LIST_VEHICLES");
    if (vehicles == null) {
        vehicles = new ArrayList<>();
    }
%>
<section class="content-box vehicle-page">
    <h1>Vehicle Information</h1>
    <p class="form-note">Manage the vehicles linked to your account.</p>

    <p class="error-message">${requestScope.ERROR}</p>
    <p class="success-message">${requestScope.SUCCESS}</p>

    <div class="vehicle-layout">
        <div class="vehicle-left">
            <form action="MainController" method="post" class="vehicle-form">
                <h2>Add Vehicle</h2>
                <input type="hidden" name="action" value="vehicles">
                <input type="hidden" name="vehicleAction" value="add">

                <div class="form-group">
                    <label>License plate</label>
                    <input type="text" name="licensePlate" placeholder="51A-123.45" required>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label>Brand</label>
                        <input type="text" name="brand" placeholder="Toyota" required>
                    </div>

                    <div class="form-group">
                        <label>Model</label>
                        <input type="text" name="model" placeholder="Vios" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Color</label>
                    <input type="text" name="color" placeholder="White" required>
                </div>

                <button type="submit">Add Vehicle</button>
            </form>
        </div>

        <div class="vehicle-right">
            <h2>My Vehicles</h2>

            <table class="vehicle-table">
                <thead>
                    <tr>
                        <th>License plate</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Color</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (vehicles.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="5">No vehicle data.</td>
                    </tr>
                    <%
                        } else {
                            for (VehicleDTO vehicle : vehicles) {
                    %>
                    <tr>
                        <td><%= vehicle.getLicensePlate() %></td>
                        <td><%= vehicle.getBrand() %></td>
                        <td><%= vehicle.getModel() %></td>
                        <td><%= vehicle.getColor() %></td>
                        <td>
                            <div class="vehicle-actions">
                                <form action="MainController" method="post">
                                    <input type="hidden" name="action" value="vehicleEdit">
                                    <input type="hidden" name="vehicleAction" value="edit">
                                    <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>">
                                    <button type="submit" class="edit-link">Edit</button>
                                </form>

                                <form action="MainController" method="post" onsubmit="return confirm('Delete this vehicle?');">
                                    <input type="hidden" name="action" value="vehicles">
                                    <input type="hidden" name="vehicleAction" value="delete">
                                    <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId() %>">
                                    <button type="submit" class="delete-button">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</section>
