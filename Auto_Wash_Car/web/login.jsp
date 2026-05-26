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
        <%@include file="includes/header.jsp"%>
        <main class="page auth-page">
            <section class="auth-box">
                <h1>Login</h1>

                <%-- Hien thong bao loi khi dang nhap sai hoac tai khoan bi khoa. --%>
                <p class="error-message">${requestScope.ERROR}</p>
                <p class="success-message">${requestScope.SUCCESS}</p>

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
