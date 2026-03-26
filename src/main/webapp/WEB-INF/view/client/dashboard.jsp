<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhà thông minh - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .room-card { transition: transform 0.2s, box-shadow 0.2s; cursor: pointer; }
        .room-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/WEB-INF/view/client/layout/_sidebar.jsp" />
            <main class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <div class="pb-2 mb-3 border-bottom">
                    <h2><i class="bi bi-grid-1x2"></i> Tổng quan nhà thông minh</h2>
                    <p class="text-muted">Chọn phòng để xem dữ liệu cảm biến</p>
                </div>

                <c:if test="${empty rooms}">
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle"></i> Chưa có phòng nào. Hãy liên hệ Admin để thêm phòng.
                    </div>
                </c:if>

                <div class="row g-4">
                    <c:forEach var="room" items="${rooms}">
                        <div class="col-md-4 col-sm-6">
                            <a href="/client/room/${room.id}" class="text-decoration-none">
                                <div class="card room-card h-100 border-0 shadow-sm">
                                    <div class="card-body text-center py-4">
                                        <i class="bi ${room.icon}" style="font-size: 3rem; color: #2c5364;"></i>
                                        <h4 class="card-title mt-3 text-dark">${room.name}</h4>
                                        <p class="text-muted mb-0">
                                            <c:choose>
                                                <c:when test="${room.sensors != null && room.sensors.size() > 0}">
                                                    <span class="badge bg-success">${room.sensors.size()} cảm biến</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">Chưa có cảm biến</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
