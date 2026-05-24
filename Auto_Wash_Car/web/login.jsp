<%-- 
    Document   : login
    Purpose    : Login UI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Auto Wash Pro</title>
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <main class="page auth-page">
            <section class="auth-box">
                <h1>Login</h1>

                <form action="login" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <button type="submit">Login</button>
                </form>

                <p class="text-center">
                    <a href="register.jsp">Create an account</a>
                </p>
            </section>
        </main>
    </body>
</html>
