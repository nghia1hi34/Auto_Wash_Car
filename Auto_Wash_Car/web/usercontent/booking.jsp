<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Book a Car Wash</h1>
<p class="form-note">Schedule your next premium wash.</p>

<form action="booking" method="post">

    <div class="form-group">
        <label>Select Vehicle</label>

        <select name="vehicleId" required>

            <option value="1" style="color:black">
                51A-99999 - Toyota Camry
            </option>

            <option value="2" style="color:black">
                52B-12345 - Honda Civic
            </option>

        </select>
    </div>

    <div class="form-group">
        <label>Select Service</label>

        <select name="serviceId" required>

            <option value="1" style="color:black">
                Basic Wash - 100.000 VND
            </option>

            <option value="2" style="color:black">
                Premium Wash - 2500.000 VND
            </option>

        </select>
    </div>

    <div class="form-group">
        <label>Booking Date & Time</label>

        <input
            type="datetime-local"
            name="bookingTime"
            required>
    </div>

    <div class="form-group">
        <label>Notes</label>

        <textarea
            name="note"
            rows="4"
            placeholder="Additional requests..."
            style="color:black"></textarea>
    </div>

    <div class="booking-summary">

        <h2>Booking Summary</h2>

        <p>
            Service price and membership discount
            will be calculated automatically
            after you confirm the booking.
        </p>

    </div>

    <button type="submit">
        Confirm Booking
    </button>

</form>


