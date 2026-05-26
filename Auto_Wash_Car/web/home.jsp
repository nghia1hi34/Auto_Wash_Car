<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Home - Auto Wash Pro</title>

    <link rel="stylesheet"
          href="assets/css/style.css">

</head>

<body class="auth-page">

<header class="topbar">

    <a href="home.jsp">
        Auto Wash Pro
    </a>

    <nav>

        <a href="profile.jsp">
            Profile
        </a>

        <a href="vehicles.jsp">
            Vehicles
        </a>

        <a href="logout">
            Logout
        </a>

    </nav>

</header>

<main class="page">

    <section class="content-box dashboard">

        <h1>
            Welcome to Auto Wash Pro
        </h1>

        <p>
            Choose a feature below
        </p>

        <div class="dashboard-grid">

            <a href="booking.jsp"
               class="dashboard-card">

                <h2>Booking</h2>

                <p>
                    Book your next wash
                </p>

            </a>

            <a href="history.jsp"
               class="dashboard-card">

                <h2>History</h2>

                <p>
                    View wash history
                </p>

            </a>

            <a href="rewards.jsp"
               class="dashboard-card">

                <h2>Rewards</h2>

                <p>
                    Check loyalty points
                </p>

            </a>

            <a href="profile.jsp"
               class="dashboard-card">

                <h2>Profile</h2>

                <p>
                    Manage your account
                </p>

            </a>

        </div>

    </section>

</main>

</body>

</html>