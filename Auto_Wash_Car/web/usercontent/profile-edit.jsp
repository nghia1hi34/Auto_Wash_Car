<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-box profile-page">
    <h1>Edit Profile</h1>
    <p class="form-note">Review and update user account details.</p>

    <div class="user-summary" style="margin-bottom: 26px;">
        <div class="summary-card">
            <h3>Account</h3>
            <p style="font-size: 18px; word-break: break-word;">${empty sessionScope.LOGIN_USER.fullName ? "User" : sessionScope.LOGIN_USER.fullName}</p>
        </div>

        <div class="summary-card">
            <h3>Email</h3>
            <p style="font-size: 18px; word-break: break-word;">${empty sessionScope.LOGIN_USER.email ? "N/A" : sessionScope.LOGIN_USER.email}</p>
        </div>

        <div class="summary-card">
            <h3>Status</h3>
            <p>${sessionScope.LOGIN_USER.status ? "Active" : "Inactive"}</p>
        </div>
    </div>

    <nav class="profile-tabs" aria-label="Profile management">
        <a href="main.jsp?page=profile">Overview</a>
        <a class="active" href="main.jsp?page=profile-edit">Edit Profile</a>
        <a href="main.jsp?page=profile-security">Security</a>
    </nav>

    <form class="profile-form" action="#" method="post">
        <h2>Account Information</h2>

        <div class="form-grid">
            <div class="form-group">
                <label for="userId">User ID</label>
                <input id="userId" type="text" name="user_id" value="${sessionScope.LOGIN_USER.userId}" readonly>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <input id="role" type="text" name="role" value="${sessionScope.LOGIN_USER.role}" readonly>
            </div>

            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input id="fullName" type="text" name="full_name" value="${sessionScope.LOGIN_USER.fullName}" placeholder="Enter full name">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" value="${sessionScope.LOGIN_USER.email}" placeholder="name@example.com">
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input id="phone" type="tel" name="phone" value="${sessionScope.LOGIN_USER.phone}" placeholder="Enter phone number">
            </div>

            <div class="form-group">
                <label for="createdAt">Created At</label>
                <input id="createdAt" type="text" name="created_at" value="${sessionScope.LOGIN_USER.createdAt}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status">
                <option value="active" ${sessionScope.LOGIN_USER.status ? 'selected' : ''}>Active</option>
                <option value="inactive" ${sessionScope.LOGIN_USER.status ? '' : 'selected'}>Inactive</option>
            </select>
        </div>

        <div class="profile-form-actions">
            <a class="button-link secondary" href="main.jsp?page=profile">Cancel</a>
            <button type="button">Save Changes</button>
        </div>
    </form>
</section>
