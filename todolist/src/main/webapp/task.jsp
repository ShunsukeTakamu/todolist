<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<!-- メニュー（モバイル用） -->
	<nav class="navbar navbar-light bg-light d-md-none px-3">
		<button class="btn btn-outline-secondary" type="button"
			data-bs-toggle="collapse" data-bs-target="#sidebarMenu">
			メニュー</button>
	</nav>

	<div class="d-md-flex">
		<!-- サイドバー -->
		<div class="collapse d-md-block" id="sidebarMenu">
			<div class="sidebar">
				<h5>メニュー</h5>
				<a href="create.jsp">新規作成</a> <a href="task.jsp">タスク一覧</a> <br>
				<a href="login.jsp" class="btn btn-outline-danger mt-4">ログアウト</a>
			</div>
		</div>

		<!-- メイン -->
		<div class="content">
			<div class="text-end mb-3" id="welcomeArea">
				こんにちは、<strong>${sessionScope.username}</strong> 様
			</div>

			<h3 class="text-center">タスク一覧</h3>

			<div
				class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
				<button class="btn btn-secondary" onclick="toggleForm()">＋追加</button>
			</div>

			<!-- 入力フォーム -->
			<form id="addForm" class="row g-2 mb-4 d-none" action="TaskServlet"
				method="post">
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

			<!-- タスク表示テーブル -->
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
									<button class="btn btn-sm btn-outline-primary me-1" disabled>編集</button>
									<button class="btn btn-sm btn-outline-danger me-1" disabled>削除</button>
									<button class="btn btn-sm btn-outline-info me-1" disabled>詳細</button>
								</td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
		</div>
	</div>

	<script>

	  function submitToggle(id, isChecked) {
		    const form = document.createElement("form");
		    form.method = "post";
		    form.action = "TaskToggleServlet";

		    // taskId を送信
		    const taskIdInput = document.createElement("input");
		    taskIdInput.type = "hidden";
		    taskIdInput.name = "taskId";
		    taskIdInput.value = id;
		    form.appendChild(taskIdInput);  // ←ここ修正

		    // チェックされていたら done=true を送信
		    if (isChecked) {
		      const doneInput = document.createElement("input");
		      doneInput.type = "hidden";
		      doneInput.name = "done";
		      doneInput.value = "true";
		      form.appendChild(doneInput);
		    }

		    document.body.appendChild(form);
		    form.submit();
		  }
	
        function toggleForm() {
            document.getElementById("addForm").classList.toggle("d-none");
        }

        function addTask(event) {
            event.preventDefault();

            const name = document.getElementById("taskName").value;
            const due = document.getElementById("dueDate").value;
            const assignee = document.getElementById("assignee").value;

            const tbody = document.querySelector("table tbody");
            const row = document.createElement("tr");
            row.innerHTML = `
                <td><input type="checkbox"></td>
                <td>${name}</td>
                <td>${due}</td>
                <td>${assignee}</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary me-1" disabled>編集</button>
                  <button class="btn btn-sm btn-outline-danger me-1" disabled>削除</button>
                  <button class="btn btn-sm btn-outline-info me-1" disabled>詳細</button>
                </td>
            `;
            tbody.appendChild(row);

            document.getElementById("addForm").reset();
            document.getElementById("addForm").classList.add("d-none");
        }

        
    </script>
</body>

</html>
