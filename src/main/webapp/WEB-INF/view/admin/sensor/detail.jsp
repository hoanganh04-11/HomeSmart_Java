<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Cảm biến - IoT Smart Home</title>
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
                    <h2><i class="bi bi-info-circle"></i> Chi tiết Cảm biến</h2>
                </div>

                <div class="row">
                    <!-- Thông tin cảm biến -->
                    <div class="col-md-5 col-12 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title mb-0">
                                    <i class="bi bi-cpu"></i> ${sensor.name}
                                </h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <th style="width: 40%">ID:</th>
                                            <td>${sensor.id}</td>
                                        </tr>
                                        <tr>
                                            <th>Tên:</th>
                                            <td>${sensor.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Loại:</th>
                                            <td><span class="badge bg-info text-dark">${sensor.type}</span></td>
                                        </tr>
                                        <tr>
                                            <th>Phòng:</th>
                                            <td>${sensor.room != null ? sensor.room.name : 'N/A'}</td>
                                        </tr>
                                        <tr>
                                            <th>Ngưỡng cảnh báo:</th>
                                            <td>${sensor.threshold != null ? sensor.threshold : 'Chưa đặt'}</td>
                                        </tr>
                                        <tr>
                                            <th>Trạng thái:</th>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${sensor.status == 'ACTIVE'}">
                                                        <span class="badge bg-success">Hoạt động</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Tắt</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Ngày tạo:</th>
                                            <td>${sensor.createdAt}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer d-flex gap-2">
                                <a href="/admin/sensor/update/${sensor.id}" class="btn btn-warning">
                                    <i class="bi bi-pencil"></i> Sửa
                                </a>
                                <a href="/admin/sensor/delete/${sensor.id}" class="btn btn-danger">
                                    <i class="bi bi-trash"></i> Xóa
                                </a>
                                <a href="/admin/sensor" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Quay lại
                                </a>
                            </div>
                        </div>

                        <!-- API Info Card -->
                        <div class="card shadow-sm mt-3">
                            <div class="card-header bg-dark text-white">
                                <h6 class="mb-0"><i class="bi bi-code-slash"></i> API Endpoint cho ESP32</h6>
                            </div>
                            <div class="card-body">
                                <p class="mb-1"><strong>POST</strong> <code>/api/v1/sensor-data</code></p>
                                <pre class="bg-light p-2 rounded"><code>{
  "sensorId": ${sensor.id},
  "value": 28.5,
  "unit": "°C"
}</code></pre>
                            </div>
                        </div>
                    </div>

                    <!-- Dữ liệu từ ESP32 (đọc từ DB) -->
                    <div class="col-md-7 col-12">
                        <div class="card shadow-sm">
                            <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                                <h5 class="mb-0"><i class="bi bi-graph-up"></i> Dữ liệu cảm biến (từ ESP32)</h5>
                                <span class="badge bg-light text-dark">10 bản ghi mới nhất</span>
                            </div>
                            <div class="card-body">
                                <c:if test="${empty sensorDataList}">
                                    <div class="alert alert-info">
                                        <i class="bi bi-info-circle"></i> Chưa có dữ liệu. ESP32 chưa gửi data cho sensor này.
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
