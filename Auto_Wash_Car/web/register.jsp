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
        <link rel="stylesheet" href="assets/css/style.css?v=2">
    </head>
    <body class="auth-body">
        <%@include file="includes/header.jsp"%>
        <main class="page auth-page">
            <section class="auth-box register-box">
                <h1>Register</h1>
                <p class="form-note">Create a customer account for Auto Wash Pro.</p>

                <%-- Hien thong bao loi/thanh cong khi RegisterServlet xu ly xong. --%>
                <p class="error-message">${requestScope.ERROR}</p>
                <p class="success-message">${requestScope.SUCCESS}</p>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <%--
                        Users table:
                        full_name, email, password, role, phone.
                        Luu y: role khong cho user chon, mac dinh la CUSTOMER o RegisterServlet.
                    --%>
                    <div class="form-section">
                        <h2>Account Information</h2>

                        <div class="form-group">
                            <label for="fullName">Full name</label>
                            <input type="text" id="fullName" name="fullName"
                                   placeholder="Nguyen Van A" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email"
                                   placeholder="customer@gmail.com" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone"
                                   placeholder="0912345678">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Confirm password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>

                    <button type="submit">Register</button>
                </form>

                <p class="text-center">
                    <a href="${pageContext.request.contextPath}/MainController?action=loginPage">Already have an account?</a>
                </p>
            </section>
        </main>
    </body>
</html>
