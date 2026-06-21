<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box">
    <h1>Wash History</h1>
    <p class="form-note">
        Recent bookings and completed washes for
        ${empty sessionScope.LOGIN_USER.fullName ? "your account" : sessionScope.LOGIN_USER.fullName}.
    </p>

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
                <td colspan="5">Wash history data will be shown here after bookings are completed.</td>
            </tr>
        </tbody>
    </table>
</section>
