<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Admin Sidebar Navigation -->
<nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar min-vh-100">
    <div class="position-sticky pt-3">
        <div class="text-center mb-4 px-3">
            <h5 class="text-white">
                <i class="bi bi-house-gear-fill"></i> Smart Home
            </h5>
            <small class="text-secondary">Admin Panel</small>
        </div>

        <hr class="text-secondary" />

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link text-white" href="/">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-secondary text-uppercase">
            <span>IoT Smart Home</span>
        </h6>
        <ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link text-white" href="/admin/room">
                    <i class="bi bi-door-open"></i> Phòng
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="/admin/sensor">
                    <i class="bi bi-cpu"></i> Cảm biến
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white-50 disabled" href="javascript:void(0)">
                    <i class="bi bi-plug"></i> Thiết bị <span class="badge bg-secondary ms-1">Sắp ra mắt</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white-50 disabled" href="javascript:void(0)">
                    <i class="bi bi-bell"></i> Cảnh báo <span class="badge bg-secondary ms-1">Sắp ra mắt</span>
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-secondary text-uppercase">
            <span>Quản lý</span>
        </h6>
        <ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link text-white" href="/admin/user">
                    <i class="bi bi-people"></i> Người dùng
                </a>
            </li>
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
