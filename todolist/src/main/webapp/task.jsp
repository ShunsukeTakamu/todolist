<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="css/bootstrap.min.css" rel="stylesheet" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>タスク一覧</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
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
	<!-- モバイル用メニュー -->
	<nav class="navbar navbar-light bg-light d-md-none px-3">
		<button class="btn btn-outline-secondary" type="button"
			data-bs-toggle="collapse" data-bs-target="#sidebarMenu">メニュー</button>
	</nav>

	<div class="d-md-flex">
		<!-- サイドバー -->
		<div class="collapse d-md-block" id="sidebarMenu">
			<div class="sidebar">
				<h5>メニュー</h5>
				<a href="TaskCreateServlet">新規作成</a> <a href="TaskServlet">タスク一覧</a>
				<br> <a href="LoginServlet" class="btn btn-outline-danger mt-4">ログアウト</a>
			</div>
		</div>

		<!-- メイン -->
		<div class="content">
			<div class="text-end mb-3" id="welcomeArea">
				こんにちは、<strong>${sessionScope.username}</strong> さん
			</div>

			<h3 class="text-center">タスク一覧</h3>

			<div
				class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
				<button class="btn btn-secondary" onclick="toggleForm()">＋追加</button>
			</div>

			<!-- 新規追加フォーム -->
			<form id="addForm" class="row g-2 mb-4 d-none"
				action="TaskCreateServlet" method="post">
				<div class="col-12 col-md-3">
					<input type="text" name="title" class="form-control"
						placeholder="タスク名" required />
				</div>
				<div class="col-6 col-md-3">
					<input type="date" name="dueDate" class="form-control" required />
				</div>
				<div class="col-6 col-md-3">
					<input type="text" name="assignee" class="form-control"
						placeholder="担当者" required />
				</div>
				<div class="col-12 col-md-3 d-grid">
					<button type="submit" class="btn btn-primary">追加</button>
				</div>
			</form>

			<!-- タスクテーブル -->
			<div class="table-wrapper mx-auto"
				style="max-width: 1000px; width: 100%; padding: 0 10px;">
				<table
					class="table table-bordered table-sm table-hover text-center align-middle">
					<thead class="table-light">
						<tr>
							<th>状態</th>
							<th>タスク名</th>
							<th>期限</th>
							<th>担当者</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${tasks}">
							<tr>
								<td>
									<form action="TaskToggleServlet" method="post"
										style="display: inline;">
										<input type="hidden" name="taskId" value="${t.id}" /> <input
											type="checkbox" name="done" ${t.done ? "checked" : ""}
											onchange="this.form.submit();" />
									</form>
								</td>
								<td>${t.title}</td>
								<td>${t.dueDate}</td>
								<td>${t.assignee}</td>
								<td class="text-nowrap">
									<button type="button"
										class="btn btn-sm btn-outline-primary me-1"
										onclick="openEditModal(${t.id}, '${fn:escapeXml(t.title)}', '${t.dueDate}', '${fn:escapeXml(t.assignee)}')">編集</button>
									<form action="TaskDeleteServlet" method="post"
										style="display: inline;">
										<input type="hidden" name="taskId" value="${t.id}" />
										<button class="btn btn-sm btn-outline-danger me-1">削除</button>
									</form>
									<button class="btn btn-sm btn-outline-info me-1">詳細</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 編集モーダル -->
			<div class="modal fade" id="editModal" tabindex="-1"
				aria-labelledby="editModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form class="modal-content" action="TaskUpdateServlet"
						method="post">
						<div class="modal-header">
							<h5 class="modal-title" id="editModalLabel">タスク編集</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="閉じる"></button>
						</div>
						<div class="modal-body">
							<input type="hidden" name="id" id="modal-task-id" />

							<div class="mb-3">
								<label class="form-label">タスク名</label> <input type="text"
									name="title" class="form-control" id="modal-title" />
								<div class="form-text">
									<span id="original-title"></span>
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">期限</label> <input type="date"
									name="dueDate" class="form-control" id="modal-dueDate" />
								<div class="form-text">
									<span id="original-dueDate"></span>
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">担当者</label> <input type="text"
									name="assignee" class="form-control" id="modal-assignee" />
								<div class="form-text">
									<span id="original-assignee"></span>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">保存</button>

							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">キャンセル</button>
						</div>
					</form>
				</div>
			</div>

			
		</div>
	</div>

	<script>
    function toggleForm() {
      document.getElementById("addForm").classList.toggle("d-none");
    }

    function openEditModal(id, title, dueDate, assignee) {
      document.getElementById("modal-task-id").value = id;
      document.getElementById("modal-title").value = title;
      document.getElementById("modal-dueDate").value = dueDate;
      document.getElementById("modal-assignee").value = assignee;

      document.getElementById("original-title").innerText = title;
      document.getElementById("original-dueDate").innerText = dueDate;
      document.getElementById("original-assignee").innerText = assignee;

      const modal = new bootstrap.Modal(document.getElementById("editModal"));
      modal.show();
    }


  </script>
</body>

</html>
