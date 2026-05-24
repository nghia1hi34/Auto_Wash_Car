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
