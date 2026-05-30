<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body class="app-body">

    <!-- TOP HEADER -->
    <header class="app-header">

        <div class="app-brand">
            <strong>Auto Wash Pro</strong>
            <span>User Profile</span>
        </div>

        <div class="app-header-actions">
            <span class="user-chip">
                ${sessionScope.LOGIN_USER.fullName}
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

        <a href="profile.jsp">Profile</a>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="app-content">

        <section class="content-box">

            <h1>User Profile</h1>

            <div class="user-summary">

                <div class="summary-card">
                    <h3>Full Name</h3>
                    <p>${sessionScope.LOGIN_USER.fullName}</p>
                </div>

                <div class="summary-card">
                    <h3>Email</h3>
                    <p>${sessionScope.LOGIN_USER.email}</p>
                </div>

                <div class="summary-card">
                    <h3>Phone</h3>
                    <p>${sessionScope.LOGIN_USER.phone}</p>
                </div>

            </div>

            <div class="vehicle-layout">

                <div class="vehicle-left">

                    <h2>Account Information</h2>

                    <div class="info-list">

                        <p>
                            <strong>Full Name:</strong>
                            ${sessionScope.LOGIN_USER.fullName}
                        </p>

                        <p>
                            <strong>Email:</strong>
                            ${sessionScope.LOGIN_USER.email}
                        </p>

                        <p>
                            <strong>Phone:</strong>
                            ${sessionScope.LOGIN_USER.phone}
                        </p>

                        <p>
                            <strong>Role:</strong>
                            ${sessionScope.LOGIN_USER.role}
                        </p>

                    </div>

                </div>

                <div class="vehicle-right">

                    <h2>Account Status</h2>

                    <table class="vehicle-table">

                        <tbody>

                            <tr>
                                <th>Role</th>
                                <td>${sessionScope.LOGIN_USER.role}</td>
                            </tr>

                            <tr>
                                <th>Email</th>
                                <td>${sessionScope.LOGIN_USER.email}</td>
                            </tr>

                            <tr>
                                <th>Phone</th>
                                <td>${sessionScope.LOGIN_USER.phone}</td>
                            </tr>

                            <tr>
                                <th>Status</th>
                                <td>Active</td>
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