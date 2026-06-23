<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="content-box dashboard">
    <h1>Welcome to Auto Wash Pro</h1>
    <p class="form-note">Select a feature from your dashboard.</p>

    <div class="user-summary">
        <div class="summary-card">
            <h3>Current Tier</h3>
            <p>Gold</p>
        </div>

        <div class="dashboard-grid">
            <a href="MainController?action=booking" class="dashboard-card">
                <h2>Book Wash</h2>
                <p>Schedule your next wash</p>
            </a>

            <a href="MainController?action=history" class="dashboard-card">
                <h2>Wash History</h2>
                <p>View all previous washes</p>
            </a>

            <a href="MainController?action=rewards" class="dashboard-card">
                <h2>Rewards</h2>
                <p>Check points and benefits</p>
            </a>

            <a href="MainController?action=vehicles" class="dashboard-card">
                <h2>My Vehicles</h2>
                <p>Manage registered vehicles</p>
            </a>
        </div>

</main>
