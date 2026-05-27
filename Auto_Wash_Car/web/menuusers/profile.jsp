<%-- 
    Document   : profile
    Purpose    : Customer profile UI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Auto Wash Pro</title>
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
                <h1>User Information</h1>

                <div class="info-list">
                    <p><strong>Full name:</strong> ${sessionScope.LOGIN_USER.fullName}</p>
                    <p><strong>Email:</strong> ${sessionScope.LOGIN_USER.email}</p>
                    <p><strong>Phone:</strong> ${sessionScope.LOGIN_USER.phone}</p>
                    <p><strong>Role:</strong> ${sessionScope.LOGIN_USER.role}</p>
                </div>
            </section>
        </main>
    </body>
</html>
