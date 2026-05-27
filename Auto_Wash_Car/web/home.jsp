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

    <a href="menuusers/booking.jsp">Booking</a>
            
        </a>

    <a href="menuusers/history.jsp">History</a>
            
        </a>

        <a href="menuusers/rewards.jsp">Rewards</a>
            
        </a>

        <a href="menuusers/profile.jsp">Profile</a>
            
        </a>

        <a href="menuusers/vehicles.jsp">Vehicles</a>
            
        </a>

        <a href="logout">
            Logout
        </a>

    </nav>

</header>

<main class="page">
        <!-- QUICK INFO -->

        <div class="user-summary">

            <div class="summary-card">

                <h3>
                    Current Tier
                </h3>

                <p>
                    Gold
                </p>

            </div>

            <div class="summary-card">

                <h3>
                    Loyalty Points
                </h3>

                <p>
                    1250
                </p>

            </div>

            <div class="summary-card">

                <h3>
                    Total Washes
                </h3>

                <p>
                    18
                </p>

            </div>

        </div>

        <!-- DASHBOARD -->

        <div class="dashboard-grid">

            <a href="menuusers/booking.jsp"
               class="dashboard-card">

                <h2>
                    Book Wash
                </h2>

                <p>
                    Schedule your next wash
                </p>

            </a>

            <a href="menuusers/history.jsp"
               class="dashboard-card">

                <h2>
                    Wash History
                </h2>

                <p>
                    View all previous washes
                </p>

            </a>

            <a href="menuusers/rewards.jsp"
               class="dashboard-card">

                <h2>
                    Rewards
                </h2>

                <p>
                    Check points and benefits
                </p>

            </a>

            <a href="menuusers/vehicles.jsp"
               class="dashboard-card">

                <h2>
                    My Vehicles
                </h2>

                <p>
                    Manage registered vehicles
                </p>

            </a>

        </div>

    </section>

</main>

</body>

</html>