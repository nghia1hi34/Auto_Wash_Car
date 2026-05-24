<%-- 
    Document   : register
    Purpose    : Register UI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - Auto Wash Pro</title>
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <main class="page auth-page">
            <section class="auth-box">
                <h1>Register</h1>

                <form action="register" method="post">
                    <div class="form-group">
                        <label for="fullName">Full name</label>
                        <input type="text" id="fullName" name="fullName" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <button type="submit">Register</button>
                </form>

                <p class="text-center">
                    <a href="login.jsp">Already have an account?</a>
                </p>
            </section>
        </main>
    </body>
</html>
