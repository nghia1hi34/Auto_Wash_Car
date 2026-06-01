<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box profile-page">
    <h1>Security</h1>
    <p class="form-note">Manage password and account access information.</p>

    <div class="user-summary" style="margin-bottom: 26px;">
        <div class="summary-card">
            <h3>Email</h3>
            <p style="font-size: 18px; word-break: break-word;">${empty sessionScope.LOGIN_USER.email ? "N/A" : sessionScope.LOGIN_USER.email}</p>
        </div>

        <div class="summary-card">
            <h3>Password</h3>
            <p>Protected</p>
        </div>

        <div class="summary-card">
            <h3>Status</h3>
            <p>${sessionScope.LOGIN_USER.status ? "Active" : "Inactive"}</p>
        </div>
    </div>

    <nav class="profile-tabs" aria-label="Profile management">
        <a href="main.jsp?page=profile">Overview</a>
        <a href="main.jsp?page=profile-edit">Edit Profile</a>
        <a class="active" href="main.jsp?page=profile-security">Security</a>
    </nav>

    <div class="security-layout">
        <form class="profile-form" action="#" method="post">
            <h2>Change Password</h2>

            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input id="currentPassword" type="password" name="current_password" value="" placeholder="Enter current password">
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input id="newPassword" type="password" name="new_password" placeholder="Enter new password">
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input id="confirmPassword" type="password" name="confirm_password" placeholder="Confirm new password">
                </div>
            </div>

            <button type="button">Update Password</button>
        </form>

        <aside class="security-card">
            <h2>Account Access</h2>

            <div class="detail-item">
                <span>Email</span>
                <strong>${empty sessionScope.LOGIN_USER.email ? "Not updated" : sessionScope.LOGIN_USER.email}</strong>
            </div>

            <div class="detail-item">
                <span>Password</span>
                <strong>••••••••</strong>
            </div>

            <div class="detail-item">
                <span>Status</span>
                <strong>${sessionScope.LOGIN_USER.status ? "Active" : "Inactive"}</strong>
            </div>
        </aside>
    </div>
</section>
