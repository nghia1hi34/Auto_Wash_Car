<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box">
    <h1>User Information</h1>

    <div class="info-list">
        <p><strong>Full name:</strong> ${sessionScope.LOGIN_USER.fullName}</p>
        <p><strong>Email:</strong> ${sessionScope.LOGIN_USER.email}</p>
        <p><strong>Phone:</strong> ${sessionScope.LOGIN_USER.phone}</p>
        <p><strong>Role:</strong> ${sessionScope.LOGIN_USER.role}</p>
    </div>
</section>
