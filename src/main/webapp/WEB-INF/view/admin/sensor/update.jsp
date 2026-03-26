<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật Cảm biến - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="/WEB-INF/view/admin/layout/_sidebar.jsp" />

            <!-- Main Content -->
            <main class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <div class="pb-2 mb-3 border-bottom">
                    <h2><i class="bi bi-pencil-square"></i> Cập nhật Cảm biến</h2>
                </div>

                <div class="row">
                    <div class="col-md-6 col-12">
                        <form:form method="post" action="/admin/sensor/update" modelAttribute="sensor">
                            <form:hidden path="id" />
                            <form:hidden path="createdAt" />

                            <div class="mb-3">
                                <label class="form-label">Tên cảm biến <span class="text-danger">*</span></label>
                                <form:input type="text" class="form-control" path="name" required="required" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Loại cảm biến <span class="text-danger">*</span></label>
                                <form:select class="form-select" path="type" required="required">
                                    <form:option value="">-- Chọn loại --</form:option>
                                    <form:option value="TEMPERATURE">Nhiệt độ</form:option>
                                    <form:option value="HUMIDITY">Độ ẩm</form:option>
                                    <form:option value="LIGHT">Ánh sáng</form:option>
                                    <form:option value="MOTION">Chuyển động</form:option>
                                    <form:option value="GAS">Khí gas</form:option>
                                    <form:option value="SMOKE">Khói</form:option>
                                </form:select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Phòng <span class="text-danger">*</span></label>
                                <select class="form-select" name="roomId" required>
                                    <option value="">-- Chọn phòng --</option>
                                    <c:forEach var="room" items="${rooms}">
                                        <option value="${room.id}" ${sensor.room != null && sensor.room.id == room.id ? 'selected' : ''}>${room.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Ngưỡng cảnh báo</label>
                                <form:input type="number" step="0.1" class="form-control" path="threshold" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Trạng thái</label>
                                <form:select class="form-select" path="status">
                                    <form:option value="ACTIVE">Hoạt động</form:option>
                                    <form:option value="INACTIVE">Tắt</form:option>
                                </form:select>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-circle"></i> Cập nhật
                                </button>
                                <a href="/admin/sensor" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Quay lại
                                </a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
