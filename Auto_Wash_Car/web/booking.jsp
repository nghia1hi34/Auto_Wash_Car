<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Booking - Auto Wash Pro</title>

    <link rel="stylesheet"
          href="assets/css/style.css">

</head>

<body class="auth-page">

<header class="topbar">

    <a href="home.jsp">
        Auto Wash Pro
    </a>

    <nav>

        <a href="home.jsp">
            Home
        </a>

        <a href="history.jsp">
            History
        </a>

        <a href="rewards.jsp">
            Rewards
        </a>

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

    <section class="content-box booking-box">

        <h1>
            Book a Car Wash
        </h1>

        <p class="form-note">
            Schedule your next premium wash
        </p>

        <!-- USER STATUS -->

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
                    Priority Booking
                </h3>

                <p>
                    12 Days
                </p>

            </div>

        </div>

        <!-- BOOKING FORM -->

        <form action="booking"
              method="post">

            <!-- VEHICLE -->

            <div class="form-group">

                <label>
                    Select Vehicle
                </label>

                <select name="vehicleId"
                        required>

                    <option disabled selected>

                        -- Select Vehicle --

                    </option>

                    <option value="1">

                        51A-99999 - Toyota Camry

                    </option>

                    <option value="2">

                        52B-12345 - Honda Civic

                    </option>

                </select>

            </div>

            <!-- SERVICE -->

            <div class="form-group">

                <label>
                    Select Service
                </label>

                <select name="serviceId"
                        required>

                    <option disabled selected>

                        -- Select Service --

                    </option>

                    <option value="1">

                        Basic Wash - 100.000đ

                    </option>

                    <option value="2">

                        Premium Wash - 250.000đ

                    </option>

                    <option value="3">

                        Full Detailing - 500.000đ

                    </option>

                </select>

            </div>

            <!-- DATE -->

            <div class="form-group">

                <label>
                    Booking Date & Time
                </label>

                <input type="datetime-local"
                       name="bookingTime"
                       required>

            </div>

            <!-- NOTE -->

            <div class="form-group">

                <label>
                    Additional Notes
                </label>

                <textarea name="note"
                          rows="4"
                          placeholder="Additional requests..."></textarea>

            </div>

            <!-- SUMMARY -->

            <div class="booking-summary">

                <h2>
                    Booking Summary
                </h2>

                <p>

                    Tier:
                    <strong>Gold Member</strong>

                </p>

                <p>

                    Original Price:
                    <strong>250.000đ</strong>

                </p>

                <p>

                    Discount:
                    <strong>20%</strong>

                </p>

                <p>

                    Points Earned:
                    <strong>+200 pts</strong>

                </p>

                <p class="final-price">

                    Final Price:
                    200.000đ

                </p>

            </div>

            <!-- BUTTON -->

            <button type="submit">

                Confirm Booking

            </button>

        </form>

    </section>

</main>

</body>

</html>