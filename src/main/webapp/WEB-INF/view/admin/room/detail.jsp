<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Phòng - IoT Smart Home</title>
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
                    <h2><i class="bi bi-info-circle"></i> Chi tiết Phòng</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="card shadow-sm">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title mb-0">
                                    <i class="bi ${room.icon}"></i> ${room.name}
                                </h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tr><th style="width:40%">ID:</th><td>${room.id}</td></tr>
                                    <tr><th>Tên:</th><td>${room.name}</td></tr>
                                    <tr><th>Icon:</th><td><i class="bi ${room.icon}"></i> ${room.icon}</td></tr>
                                    <tr><th>Ngày tạo:</th><td>${room.createdAt}</td></tr>
                                </table>
                            </div>
                            <div class="card-footer d-flex gap-2">
                                <a href="/admin/room/update/${room.id}" class="btn btn-warning"><i class="bi bi-pencil"></i> Sửa</a>
                                <a href="/admin/room/delete/${room.id}" class="btn btn-danger"><i class="bi bi-trash"></i> Xóa</a>
                                <a href="/admin/room" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Quay lại</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
