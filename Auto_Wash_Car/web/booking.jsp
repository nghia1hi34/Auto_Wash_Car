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

        <a href="home.jsp">Home</a>

        <a href="profile.jsp">Profile</a>

        <a href="vehicles.jsp">Vehicles</a>

        <a href="logout">Logout</a>

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

        <form action="booking"
              method="post">

            <div class="form-group">

                <label>
                    Select Vehicle
                </label>

                <select name="vehicleId">

                    <option>
                        51A-99999 - Toyota Camry
                    </option>

                    <option>
                        52B-12345 - Honda Civic
                    </option>

                </select>

            </div>

            <div class="form-group">

                <label>
                    Select Service
                </label>

                <select name="serviceId">

                    <option>
                        Basic Wash - 100.000đ
                    </option>

                    <option>
                        Premium Wash - 250.000đ
                    </option>

                </select>

            </div>

            <div class="form-group">

                <label>
                    Booking Date & Time
                </label>

                <input type="datetime-local"
                       name="bookingTime"
                       required>

            </div>

            <div class="form-group">

                <label>
                    Notes
                </label>

                <textarea name="note"
                          rows="4"
                          placeholder="Additional requests..."></textarea>

            </div>

            <div class="booking-summary">

                <h2>
                    Booking Summary
                </h2>

                <p>
                    Tier: Gold Member
                </p>

                <p>
                    Original Price: 250.000đ
                </p>

                <p>
                    Discount: 20%
                </p>

                <p class="final-price">
                    Final Price: 200.000đ
                </p>

            </div>

            <button type="submit">
                Confirm Booking
            </button>

        </form>

    </section>

</main>

</body>

</html>