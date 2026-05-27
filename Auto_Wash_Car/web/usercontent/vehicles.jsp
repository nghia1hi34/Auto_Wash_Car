<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box">
    <h1>Vehicle Information</h1>

    <p class="error-message">${requestScope.ERROR}</p>
    <p class="success-message">${requestScope.SUCCESS}</p>

    <form action="vehicles" method="post" class="vehicle-form">
        <h2>Add Vehicle</h2>

        <div class="form-group">
            <label for="licensePlate">License plate</label>
            <input type="text" id="licensePlate" name="licensePlate"
                   placeholder="51A-12345" required>
        </div>

        <div class="form-grid">
            <div class="form-group">
                <label for="brand">Brand</label>
                <input type="text" id="brand" name="brand" placeholder="Toyota">
            </div>

            <div class="form-group">
                <label for="model">Model</label>
                <input type="text" id="model" name="model" placeholder="Vios">
            </div>
        </div>

        <div class="form-group">
            <label for="color">Color</label>
            <input type="text" id="color" name="color" placeholder="White">
        </div>

        <button type="submit">Add Vehicle</button>
    </form>

    <h2>My Vehicles</h2>
    <table>
        <thead>
            <tr>
                <th>License plate</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Color</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="4">Vehicle data will be shown here.</td>
            </tr>
        </tbody>
    </table>
</section>
