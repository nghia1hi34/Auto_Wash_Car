<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wash History - Auto Wash Pro</title>

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body class="app-body">

    <!-- HEADER -->
    <header class="app-header">

        <div class="app-brand">
            <strong>Auto Wash Pro</strong>
            <span>Customer Portal</span>
        </div>

        <div class="app-header-actions">
            <span class="user-chip">
                ${sessionScope.account.fullName}
            </span>

            <a href="logout" class="logout-link">
                Logout
            </a>
        </div>

    </header>

    <!-- LEFT MENU -->
    <aside class="app-menu">

        <a href="dashboard">Dashboard</a>

        <a href="booking">Booking</a>

        <a href="vehicle">Vehicles</a>

        <a href="history">History</a>

        <a href="profile">Profile</a>

    </aside>

    <!-- MAIN CONTENT -->
    <main class="app-content">

        <section class="content-box">

            <h1>Wash History</h1>

            <table>

                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Vehicle</th>
                        <th>Service</th>
                        <th>Total</th>
                        <th>Points</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td colspan="5">
                            Wash history data will be shown here.
                        </td>
                    </tr>

                </tbody>

            </table>

        </section>

    </main>

    <!-- FOOTER -->
    <footer class="app-footer">

        <span>Auto Wash Pro © 2026</span>

        <span>Customer Management System</span>

    </footer>

</body>
</html>