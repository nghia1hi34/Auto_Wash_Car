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

    <div class="profile-card">

        <h2>Account Information</h2>

        <div class="profile-row">
            <span>Full Name</span>
            <span>${sessionScope.LOGIN_USER.fullName}</span>
            <a href="changeProfile?field=fullName">Change</a>
        </div>

        <div class="profile-row">
            <span>Email</span>
            <span>${sessionScope.LOGIN_USER.email}</span>
            <a href="changeProfile?field=email">Change</a>
        </div>

        <div class="profile-row">
            <span>Phone</span>
            <span>${sessionScope.LOGIN_USER.phone}</span>
            <a href="changeProfile?field=phone">Change</a>
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