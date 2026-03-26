<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${sensor.name} - IoT Smart Home</title>
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
                    <h2><i class="bi bi-cpu"></i> ${sensor.name}</h2>
                    <c:if test="${sensor.room != null}">
                        <a href="/client/room/${sensor.room.id}" class="text-decoration-none">
                            <i class="bi bi-arrow-left"></i> Quay lại ${sensor.room.name}
                        </a>
                    </c:if>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">Thông tin cảm biến</h5>
                            </div>
                            <div class="card-body">
                                <p><strong>Loại:</strong> <span class="badge bg-info text-dark">${sensor.type}</span></p>
                                <p><strong>Phòng:</strong> ${sensor.room != null ? sensor.room.name : 'N/A'}</p>
                                <p><strong>Ngưỡng:</strong> ${sensor.threshold != null ? sensor.threshold : 'Chưa đặt'}</p>
                                <p><strong>Trạng thái:</strong>
                                    <c:choose>
                                        <c:when test="${sensor.status == 'ACTIVE'}">
                                            <span class="badge bg-success">Hoạt động</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Tắt</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <div class="card-header bg-success text-white">
                                <h5 class="mb-0"><i class="bi bi-graph-up"></i> Lịch sử dữ liệu (10 bản ghi mới nhất)</h5>
                            </div>
                            <div class="card-body">
                                <c:if test="${empty sensorDataList}">
                                    <div class="alert alert-info mb-0">
                                        <i class="bi bi-info-circle"></i> Chưa có dữ liệu từ cảm biến này.
                                    </div>
                                </c:if>
                                <c:if test="${not empty sensorDataList}">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-sm">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>#</th>
                                                <th>Giá trị</th>
                                                <th>Đơn vị</th>
                                                <th>Thời gian</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="data" items="${sensorDataList}" varStatus="loop">
                                                <tr>
                                                    <td>${loop.index + 1}</td>
                                                    <td>
                                                        <strong>${data.value}</strong>
                                                        <c:if test="${sensor.threshold != null && data.value > sensor.threshold}">
                                                            <span class="badge bg-danger ms-1">Vượt ngưỡng!</span>
                                                        </c:if>
                                                    </td>
                                                    <td>${data.unit}</td>
                                                    <td>${data.recordedAt}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
