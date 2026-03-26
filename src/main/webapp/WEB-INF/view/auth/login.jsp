<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - IoT Smart Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            background: rgba(255,255,255,0.95);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            padding: 40px;
            max-width: 420px;
            width: 100%;
        }
        .login-card .logo {
            font-size: 3rem;
            color: #2c5364;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="text-center mb-4">
            <i class="bi bi-house-gear-fill logo"></i>
            <h3 class="mt-2">IoT Smart Home</h3>
            <p class="text-muted">Đăng nhập để tiếp tục</p>
        </div>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-circle"></i> Sai tên đăng nhập hoặc mật khẩu!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${param.logout != null}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle"></i> Đã đăng xuất thành công.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <form method="post" action="/login">
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-person"></i> Tên đăng nhập</label>
                <input type="text" name="username" class="form-control form-control-lg"
                       placeholder="Nhập tên đăng nhập" required autofocus />
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-lock"></i> Mật khẩu</label>
                <input type="password" name="password" class="form-control form-control-lg"
                       placeholder="Nhập mật khẩu" required />
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary btn-lg w-100 mt-2">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
            </button>
        </form>

        <div class="text-center mt-4 text-muted small">
            <i class="bi bi-shield-lock"></i> Liên hệ Admin để được cấp tài khoản
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
