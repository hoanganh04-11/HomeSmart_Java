<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Phòng - IoT Smart Home</title>
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
                    <h2><i class="bi bi-plus-circle"></i> Thêm Phòng mới</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-12">
                        <form:form method="post" action="/admin/room/create" modelAttribute="newRoom">
                            <div class="mb-3">
                                <label class="form-label">Tên phòng <span class="text-danger">*</span></label>
                                <form:input type="text" class="form-control" path="name" required="required" placeholder="VD: Phòng khách, Phòng ngủ..." />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Icon</label>
                                <form:select class="form-select" path="icon">
                                    <form:option value="bi-house">🏠 Phòng khách (bi-house)</form:option>
                                    <form:option value="bi-moon">🌙 Phòng ngủ (bi-moon)</form:option>
                                    <form:option value="bi-cup-hot">☕ Phòng bếp (bi-cup-hot)</form:option>
                                    <form:option value="bi-droplet">💧 Phòng tắm (bi-droplet)</form:option>
                                    <form:option value="bi-book">📚 Phòng học (bi-book)</form:option>
                                    <form:option value="bi-briefcase">💼 Phòng làm việc (bi-briefcase)</form:option>
                                    <form:option value="bi-car-front">🚗 Garage (bi-car-front)</form:option>
                                    <form:option value="bi-tree">🌳 Sân vườn (bi-tree)</form:option>
                                </form:select>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-circle"></i> Tạo phòng
                                </button>
                                <a href="/admin/room" class="btn btn-secondary">
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
