<%-- 
    Document   : vehicles
    Purpose    : Vehicle list UI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vehicles - Auto Wash Pro</title>
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <header class="topbar">
            <a href="home.jsp">Auto Wash Pro</a>
            <nav>
                <a href="profile.jsp">Profile</a>
                <a href="vehicles.jsp">Vehicles</a>
                <a href="logout">Logout</a>
            </nav>
        </header>

        <main class="page">
            <section class="content-box">
                <h1>Vehicle Information</h1>

                <%-- Hien thong bao khi them xe thanh cong/that bai. --%>
                <p class="error-message">${requestScope.ERROR}</p>
                <p class="success-message">${requestScope.SUCCESS}</p>

                <%--
                    Form them xe sau khi customer da dang nhap.
                    Luu y:
                    - customer_id khong nhap trong form.
                    - VehicleServlet se lay customer_id thong qua session LOGIN_USER.
                    - Mot customer co the co nhieu xe.
                --%>
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
                            <input type="text" id="brand" name="brand"
                                   placeholder="Toyota">
                        </div>

                        <div class="form-group">
                            <label for="model">Model</label>
                            <input type="text" id="model" name="model"
                                   placeholder="Vios">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="color">Color</label>
                        <input type="text" id="color" name="color"
                               placeholder="White">
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
        </main>
    </body>
</html>
