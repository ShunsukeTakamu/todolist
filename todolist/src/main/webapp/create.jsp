<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>新規作成</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="css/style.css" rel="stylesheet"> -->
<script src="js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color: #f8f9fa;
}

.text-end {
	padding-right: 10px;
}

.sidebar {
	background-color: #f8f9fa;
	height: 100vh;
	padding: 20px;
}

.sidebar a {
	text-decoration: none;
	display: block;
	margin-bottom: 10px;
}

.content {
	flex-grow: 1;
	padding: 30px;
}

.completed {
	text-decoration: line-through;
	color: #888;
}

@media ( max-width : 768px) {
	.sidebar {
		height: auto;
		padding: 10px;
	}
}
</style>
</head>

<body>

	<nav class="navbar navbar-light bg-light d-md-none px-3">
		<button class="btn btn-outline-secondary" type="button"
			data-bs-toggle="collapse" data-bs-target="#sidebarMenu">
			メニュー</button>
	</nav>

	<div class="d-md-flex">

		<div class="collapse d-md-block" id="sidebarMenu">
			<div class="sidebar">
				<h5>メニュー</h5>
				<a href="TaskCreateServlet">新規作成</a> <a href="TaskServlet">タスク一覧</a>
				<br> <a href="LoginServlet" class="btn btn-outline-danger mt-4">ログアウト</a>
			</div>
		</div>

		<!--入力フォーム -->

		<div class="content">
			<div calass="text-end mb-3" id="welcomeArea">こんにちは「</div>

			<div class="mx-auto" style="max-width: 600px;">
				<form action="TaskCreateServlet" method="post" class="mt-4">
					<div class="mb-3">
						<label class="form-label">タスク名</label> <input type="text"
							name="title" class="form-control" required>
					</div>
					<div class="mb-3">
						<label class="form-label">期限</label> <input type="date"
							name="dueDate" class="form-control" required>
					</div>
					<div class="mb-3">
						<label class="form-label">担当者</label> <input type="text"
							name="assignee" class="form-control" required>
					</div>
					<button type="submit" class="btn btn-secondary">保存して一覧へ</button>
				</form>

			</div>
		</div>
	</div>

</body>

</html>