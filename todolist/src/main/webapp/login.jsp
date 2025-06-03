<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.bundle.min.js"></script>
<style>
.form-container {
	background-color: #f8f9fa;
	padding: 30px;
	border: 1px solid #ccc;
	border-radius: 15px;
	width: 100%;
	max-width: 400px;
	margin-top: 100px;
}
</style>

</head>
<body>
	<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

	<div class="container">
		<div class="mt-1 row">
			<div class="col-12 col-md-6">
				<h1 class="mt-5 text-center text-md-start">Login</h1>
			</div>

			<div class="col-12 col-md-6 d-flex">
				<div class="form-container mx-auto">
					<form action="LoginServlet" method="post">
						<div class="mb-3 row">
							<label class="col-12 col-sm-4">氏名</label>
							<div class="col-12 col-sm-8">
								<input type="text" name="name" class="form-control"
									placeholder="氏名を入力" required>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-12 col-sm-4">パスワード</label>
							<div class="col-12 col-sm-8">
								<input type="password" name="password" class="form-control"
									placeholder="パスワードを入力" required>
							</div>
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-primary">ログイン</button>
						</div>
					</form>
					<div class="text-center mt-3">
						<a href="UserRegisterServlet">新規登録はこちら</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
