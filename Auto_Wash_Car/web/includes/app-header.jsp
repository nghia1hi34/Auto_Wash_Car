<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="app-header">
    <div class="app-brand">
        <strong>AutoWash Pro</strong>
        <span>Smart Automated Car Wash System</span>
    </div>

    <div class="app-header-actions">
        <span class="user-chip">
            ${empty sessionScope.LOGIN_USER.fullName ? "Guest" : sessionScope.LOGIN_USER.fullName}
        </span>

        <button type="button" class="theme-toggle" id="themeToggle" title="Dark mode">
            Dark
        </button>

        <a class="logout-link" href="${pageContext.request.contextPath}/MainController?action=logout">Logout</a>
    </div>
</header>
