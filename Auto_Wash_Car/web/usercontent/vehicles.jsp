<%@page import="java.util.ArrayList"%>
<%@page import="DTO.VehicleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body class="app-body">

    <!-- TOP HEADER -->
    <header class="app-header">

        <div class="app-brand">
            <strong>Auto Wash Pro</strong>
            <span>Vehicle Management</span>
        </div>

        <div class="app-header-actions">
            <span class="user-chip">
                Welcome User
            </span>

            <a href="logout" class="logout-link">
                Logout
            </a>
        </div>

    </header>

    <!-- LEFT MENU -->
    <aside class="app-menu">

        <a href="dashboard.jsp">Dashboard</a>

        <a href="vehicles.jsp">Vehicles</a>

        <a href="booking.jsp">Booking</a>

        <a href="history.jsp">History</a>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="app-content">

        <section class="content-box">

            <h1>Vehicle Information</h1>

            <p class="error-message">
                ${requestScope.ERROR}
            </p>

            <p class="success-message">
                ${requestScope.SUCCESS}
            </p>

            <div class="vehicle-layout">

                <!-- FORM -->
                <div class="vehicle-left">

                    <form action="vehicles"
                          method="post"
                          class="vehicle-form">

                        <h2>Add Vehicle</h2>

                        <input type="hidden"
                               name="action"
                               value="add">

                        <div class="form-group">
                            <label>License plate</label>

                            <input type="text"
                                   name="licensePlate"
                                   placeholder="51A-123.45"
                                   required>
                        </div>

                        <div class="form-grid">

                            <div class="form-group">
                                <label>Brand</label>

                                <input type="text"
                                       name="brand"
                                       placeholder="Toyota">
                            </div>

                            <div class="form-group">
                                <label>Model</label>

                                <input type="text"
                                       name="model"
                                       placeholder="Vios">
                            </div>

                        </div>

                        <div class="form-group">
                            <label>Color</label>

                            <input type="text"
                                   name="color"
                                   placeholder="White">
                        </div>

                        <button type="submit">
                            Add Vehicle
                        </button>

                    </form>

                </div>

                <!-- TABLE -->
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
                                ArrayList<VehicleDTO> vehicles
                                        = (ArrayList<VehicleDTO>) request.getAttribute("LIST_VEHICLES");

                                if (vehicles == null || vehicles.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="5">
                                    No vehicle data.
                                </td>
                            </tr>
                            <%
                            } else {
                                for (VehicleDTO vehicle : vehicles) {
                            %>
                    <tr>
                        <td><%= vehicle.getLicensePlate()%></td>
                        <td><%= vehicle.getBrand()%></td>
                        <td><%= vehicle.getModel()%></td>
                        <td><%= vehicle.getColor()%></td>
                        <td>
                            <div class="vehicle-actions">
                                <a class="edit-link"
                                   href="vehicle-edit?vehicleId=<%= vehicle.getVehicleId()%>">
                                    Edit
                                </a>

                                        <form action="vehicles"
                                              method="post"
                                              onsubmit="return confirm('Delete this vehicle?');">
                                            <input type="hidden"
                                                   name="action"
                                                   value="delete">
                                            <input type="hidden"
                                                   name="vehicleId"
                                                   value="<%= vehicle.getVehicleId()%>">
                                            <button type="submit"
                                                    class="delete-button">
                                                Delete
                                            </button>
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

    </main>

    <!-- FOOTER -->
    <footer class="app-footer">

        <span>
            Auto Wash Pro System
        </span>

        <span>
            © 2026
        </span>

    </footer>

</body>
