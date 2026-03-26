<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Phòng - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/WEB-INF/view/admin/layout/_sidebar.jsp" />
            <main class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h2><i class="bi bi-door-open"></i> Danh sách Phòng</h2>
                    <a href="/admin/room/create" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Thêm phòng
                    </a>
                </div>
                <c:if test="${empty rooms}">
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle"></i> Chưa có phòng nào. Hãy thêm phòng mới!
                    </div>
                </c:if>
                <c:if test="${not empty rooms}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên phòng</th>
                                <th>Icon</th>
                                <th>Ngày tạo</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="room" items="${rooms}">
                                <tr>
                                    <td>${room.id}</td>
                                    <td>${room.name}</td>
                                    <td><i class="bi ${room.icon}"></i> ${room.icon}</td>
                                    <td>${room.createdAt}</td>
                                    <td>
                                        <a href="/admin/room/${room.id}" class="btn btn-sm btn-success">
                                            <i class="bi bi-eye"></i> Xem
                                        </a>
                                        <a href="/admin/room/update/${room.id}" class="btn btn-sm btn-warning">
                                            <i class="bi bi-pencil"></i> Sửa
                                        </a>
                                        <a href="/admin/room/delete/${room.id}" class="btn btn-sm btn-danger">
                                            <i class="bi bi-trash"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                </c:if>
            </main>
        </div>
    </div>
</body>
</html>
