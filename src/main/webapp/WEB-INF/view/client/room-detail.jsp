<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${room.name} - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/WEB-INF/view/client/layout/_sidebar.jsp" />
            <main class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <div class="pb-2 mb-3 border-bottom">
                    <h2>
                        <i class="bi ${room.icon}"></i> ${room.name}
                    </h2>
                    <a href="/client/dashboard" class="text-decoration-none">
                        <i class="bi bi-arrow-left"></i> Quay lại tổng quan
                    </a>
                </div>

                <c:if test="${room.sensors == null || room.sensors.size() == 0}">
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle"></i> Phòng này chưa có cảm biến nào.
                    </div>
                </c:if>

                <c:if test="${room.sensors != null && room.sensors.size() > 0}">
                <div class="row g-4">
                    <c:forEach var="sensor" items="${room.sensors}">
                        <div class="col-md-6">
                            <div class="card shadow-sm h-100">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">
                                        <i class="bi bi-cpu"></i> ${sensor.name}
                                    </h5>
                                    <c:choose>
                                        <c:when test="${sensor.status == 'ACTIVE'}">
                                            <span class="badge bg-success">Hoạt động</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Tắt</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-body">
                                    <p class="mb-1">
                                        <strong>Loại:</strong> <span class="badge bg-info text-dark">${sensor.type}</span>
                                    </p>
                                    <p class="mb-2">
                                        <strong>Ngưỡng:</strong> ${sensor.threshold != null ? sensor.threshold : 'Chưa đặt'}
                                    </p>

                                    <h6 class="mt-3 text-muted">Dữ liệu mới nhất:</h6>
                                    <c:if test="${sensor.latestData == null || sensor.latestData.size() == 0}">
                                        <p class="text-muted fst-italic">Chưa có dữ liệu</p>
                                    </c:if>
                                    <c:if test="${sensor.latestData != null && sensor.latestData.size() > 0}">
                                    <div class="table-responsive">
                                        <table class="table table-sm table-bordered mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Giá trị</th>
                                                    <th>Đơn vị</th>
                                                    <th>Thời gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="data" items="${sensor.latestData}" end="4">
                                                    <tr>
                                                        <td>
                                                            <strong>${data.value}</strong>
                                                            <c:if test="${sensor.threshold != null && data.value > sensor.threshold}">
                                                                <span class="badge bg-danger ms-1">!</span>
                                                            </c:if>
                                                        </td>
                                                        <td>${data.unit}</td>
                                                        <td><small>${data.recordedAt}</small></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    </c:if>
                                </div>
                                <div class="card-footer">
                                    <a href="/client/sensor/${sensor.id}" class="btn btn-sm btn-outline-primary">
                                        <i class="bi bi-graph-up"></i> Xem chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                </c:if>
            </main>
        </div>
    </div>
</body>
</html>
