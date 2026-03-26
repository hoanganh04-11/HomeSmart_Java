<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa Phòng - IoT Smart Home</title>
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
                    <h2><i class="bi bi-trash"></i> Xác nhận Xóa Phòng</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="card border-danger shadow-sm">
                            <div class="card-header bg-danger text-white">
                                <h5 class="card-title mb-0">
                                    <i class="bi bi-exclamation-triangle"></i> Bạn có chắc chắn muốn xóa?
                                </h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tr><th style="width:40%">ID:</th><td>${room.id}</td></tr>
                                    <tr><th>Tên:</th><td>${room.name}</td></tr>
                                    <tr><th>Icon:</th><td><i class="bi ${room.icon}"></i> ${room.icon}</td></tr>
                                </table>
                                <div class="alert alert-warning">
                                    <i class="bi bi-exclamation-circle"></i>
                                    Tất cả cảm biến và thiết bị trong phòng này cũng sẽ bị ảnh hưởng.
                                </div>
                            </div>
                            <div class="card-footer d-flex gap-2">
                                <form method="post" action="/admin/room/delete">
                                    <input type="hidden" name="id" value="${room.id}" />
                                    <button type="submit" class="btn btn-danger"><i class="bi bi-trash"></i> Xác nhận Xóa</button>
                                </form>
                                <a href="/admin/room" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Hủy</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
