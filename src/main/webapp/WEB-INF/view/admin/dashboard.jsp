<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/WEB-INF/view/admin/layout/_sidebar.jsp" />
            <main class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <div class="pb-2 mb-3 border-bottom">
                    <h2><i class="bi bi-speedometer2"></i> Dashboard</h2>
                </div>

                <div class="row g-4 mb-4">
                    <!-- Rooms Card -->
                    <div class="col-md-4">
                        <div class="card text-white bg-primary shadow">
                            <div class="card-body d-flex align-items-center">
                                <i class="bi bi-door-open" style="font-size: 3rem;"></i>
                                <div class="ms-3">
                                    <h3 class="mb-0">${totalRooms}</h3>
                                    <span>Phòng</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent border-0">
                                <a href="/admin/room" class="text-white text-decoration-none">
                                    Xem danh sách <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Sensors Card -->
                    <div class="col-md-4">
                        <div class="card text-white bg-success shadow">
                            <div class="card-body d-flex align-items-center">
                                <i class="bi bi-cpu" style="font-size: 3rem;"></i>
                                <div class="ms-3">
                                    <h3 class="mb-0">${totalSensors}</h3>
                                    <span>Cảm biến</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent border-0">
                                <a href="/admin/sensor" class="text-white text-decoration-none">
                                    Xem danh sách <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Devices Card -->
                    <div class="col-md-4">
                        <div class="card text-white bg-warning shadow">
                            <div class="card-body d-flex align-items-center">
                                <i class="bi bi-plug" style="font-size: 3rem;"></i>
                                <div class="ms-3">
                                    <h3 class="mb-0">0</h3>
                                    <span>Thiết bị</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent border-0">
                                <span class="text-white-50">Sắp ra mắt</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-4">
                    <!-- Alerts Card -->
                    <div class="col-md-4">
                        <div class="card text-white bg-danger shadow">
                            <div class="card-body d-flex align-items-center">
                                <i class="bi bi-bell" style="font-size: 3rem;"></i>
                                <div class="ms-3">
                                    <h3 class="mb-0">0</h3>
                                    <span>Cảnh báo</span>
                                </div>
                            </div>
                            <div class="card-footer bg-transparent border-0">
                                <span class="text-white-50">Sắp ra mắt</span>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
