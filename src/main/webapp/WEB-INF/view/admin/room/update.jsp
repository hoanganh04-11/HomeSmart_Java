<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật Phòng - IoT Smart Home</title>
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
                    <h2><i class="bi bi-pencil-square"></i> Cập nhật Phòng</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-12">
                        <form:form method="post" action="/admin/room/update" modelAttribute="room">
                            <form:hidden path="id" />
                            <form:hidden path="createdAt" />
                            <div class="mb-3">
                                <label class="form-label">Tên phòng <span class="text-danger">*</span></label>
                                <form:input type="text" class="form-control" path="name" required="required" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Icon</label>
                                <form:select class="form-select" path="icon">
                                    <form:option value="bi-house">🏠 Phòng khách</form:option>
                                    <form:option value="bi-moon">🌙 Phòng ngủ</form:option>
                                    <form:option value="bi-cup-hot">☕ Phòng bếp</form:option>
                                    <form:option value="bi-droplet">💧 Phòng tắm</form:option>
                                    <form:option value="bi-book">📚 Phòng học</form:option>
                                    <form:option value="bi-briefcase">💼 Phòng làm việc</form:option>
                                    <form:option value="bi-car-front">🚗 Garage</form:option>
                                    <form:option value="bi-tree">🌳 Sân vườn</form:option>
                                </form:select>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary"><i class="bi bi-check-circle"></i> Cập nhật</button>
                                <a href="/admin/room" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Quay lại</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
