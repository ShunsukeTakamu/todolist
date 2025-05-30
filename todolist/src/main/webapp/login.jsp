<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2 class="mt-5">ログイン</h2>
		<form action="LoginServlet" method="post">
			<div class="mb-3">
				<label>ユーザー名</label> <input type="text" name="username"
					class="form-control" required>
			</div>
			<div class="mb-3">
				<label>パスワード</label> <input type="password" name="password"
					class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary">ログイン</button>
		</form>

		<p class="mt-3">
			アカウントを持っていない方は <a href="signup.jsp">新規登録</a>
		</p>
	</div>
</body>
</html>
