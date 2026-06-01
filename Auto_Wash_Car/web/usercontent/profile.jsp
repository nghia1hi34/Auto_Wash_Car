<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box profile-page">
    <h1>User Profile</h1>
    <p class="form-note">Manage account information used by Auto Wash Pro.</p>

    <div class="user-summary" style="margin-bottom: 26px;">
        <div class="summary-card">
            <h3>User ID</h3>
            <p style="word-break: break-word;">${empty sessionScope.LOGIN_USER.userId ? "N/A" : sessionScope.LOGIN_USER.userId}</p>
        </div>

        <div class="summary-card">
            <h3>Role</h3>
            <p style="word-break: break-word;">${empty sessionScope.LOGIN_USER.role ? "Customer" : sessionScope.LOGIN_USER.role}</p>
        </div>

        <div class="summary-card">
            <h3>Status</h3>
            <p>${sessionScope.LOGIN_USER.status ? "Active" : "Inactive"}</p>
        </div>
    </div>

    <nav class="profile-tabs" aria-label="Profile management">
        <a class="active" href="main.jsp?page=profile">Overview</a>
        <a href="main.jsp?page=profile-edit">Edit Profile</a>
        <a href="main.jsp?page=profile-security">Security</a>
    </nav>

    <div class="profile-overview">
        <aside class="profile-card">
            <div class="profile-avatar">
                User
            </div>

            <h2>${empty sessionScope.LOGIN_USER.fullName ? "Auto Wash User" : sessionScope.LOGIN_USER.fullName}</h2>
            <p>${empty sessionScope.LOGIN_USER.email ? "No email provided" : sessionScope.LOGIN_USER.email}</p>

            <div class="profile-actions">
                <a class="button-link" href="main.jsp?page=profile-edit">Edit Information</a>
                <a class="button-link secondary" href="main.jsp?page=profile-security">Security</a>
            </div>
        </aside>

        <div class="profile-details">
            <h2>Account Details</h2>

            <div class="detail-grid">
                <div class="detail-item">
                    <span>User ID</span>
                    <strong>${sessionScope.LOGIN_USER.userId}</strong>
                </div>

                <div class="detail-item">
                    <span>Full Name</span>
                    <strong>${empty sessionScope.LOGIN_USER.fullName ? "Not updated" : sessionScope.LOGIN_USER.fullName}</strong>
                </div>

                <div class="detail-item">
                    <span>Email</span>
                    <strong>${empty sessionScope.LOGIN_USER.email ? "Not updated" : sessionScope.LOGIN_USER.email}</strong>
                </div>

                <div class="detail-item">
                    <span>Phone</span>
                    <strong>${empty sessionScope.LOGIN_USER.phone ? "Not updated" : sessionScope.LOGIN_USER.phone}</strong>
                </div>

                <div class="detail-item">
                    <span>Role</span>
                    <strong>${empty sessionScope.LOGIN_USER.role ? "Customer" : sessionScope.LOGIN_USER.role}</strong>
                </div>

                <div class="detail-item">
                    <span>Created At</span>
                    <strong>${empty sessionScope.LOGIN_USER.createdAt ? "Not available" : sessionScope.LOGIN_USER.createdAt}</strong>
                </div>
            </div>
        </div>
    </div>
</section>
