<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Cảm biến - IoT Smart Home</title>
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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                    <h2><i class="bi bi-cpu"></i> Danh sách Cảm biến</h2>
                    <a href="/admin/sensor/create" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Thêm mới
                    </a>
                </div>

                <c:if test="${empty sensors}">
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle"></i> Chưa có cảm biến nào. Hãy thêm cảm biến mới!
                    </div>
                </c:if>

                <c:if test="${not empty sensors}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Loại</th>
                                <th>Phòng</th>
                                <th>Ngưỡng</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="sensor" items="${sensors}">
                                <tr>
                                    <td>${sensor.id}</td>
                                    <td>${sensor.name}</td>
                                    <td>
                                        <span class="badge bg-info text-dark">${sensor.type}</span>
                                    </td>
                                    <td>${sensor.room != null ? sensor.room.name : 'N/A'}</td>
                                    <td>${sensor.threshold}</td>
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
                                    <td>
                                        <a href="/admin/sensor/${sensor.id}" class="btn btn-sm btn-success">
                                            <i class="bi bi-eye"></i> Xem
                                        </a>
                                        <a href="/admin/sensor/update/${sensor.id}" class="btn btn-sm btn-warning">
                                            <i class="bi bi-pencil"></i> Sửa
                                        </a>
                                        <a href="/admin/sensor/delete/${sensor.id}" class="btn btn-sm btn-danger">
                                            <i class="bi bi-trash"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                <nav aria-label="Sensor pagination">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="/admin/sensor?page=${currentPage - 1}">
                                <i class="bi bi-chevron-left"></i> Trước
                            </a>
                        </li>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="/admin/sensor?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="/admin/sensor?page=${currentPage + 1}">
                                Sau <i class="bi bi-chevron-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
                </c:if>
                </c:if>
            </main>
        </div>
    </div>
</body>
</html>
