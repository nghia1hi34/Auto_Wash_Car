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

                    <table>

                        <thead>
                            <tr>
                                <th>License plate</th>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Color</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td colspan="4">
                                    Vehicle data will be shown here.
                                </td>
                            </tr>
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
