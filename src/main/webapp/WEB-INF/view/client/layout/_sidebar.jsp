<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Client Sidebar Navigation -->
<nav class="col-md-3 col-lg-2 d-md-block sidebar min-vh-100" style="background: linear-gradient(180deg, #1a1a2e, #16213e);">
    <div class="position-sticky pt-3">
        <div class="text-center mb-4 px-3">
            <h5 class="text-white">
                <i class="bi bi-house-gear-fill"></i> Smart Home
            </h5>
            <small class="text-info">Nhà thông minh</small>
        </div>

        <hr class="text-secondary" />

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link text-white" href="/client/dashboard">
                    <i class="bi bi-grid-1x2"></i> Tổng quan
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-secondary text-uppercase">
            <span>Phòng trong nhà</span>
        </h6>
        <ul class="nav flex-column mb-2" id="room-nav">
            <!-- Rooms will be listed here dynamically -->
        </ul>

        <hr class="text-secondary" />

        <ul class="nav flex-column">
            <li class="nav-item">
                <form method="post" action="/logout" class="px-3">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-outline-light btn-sm w-100">
                        <i class="bi bi-box-arrow-left"></i> Đăng xuất
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>
