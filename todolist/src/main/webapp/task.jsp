<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    @media (max-width: 768px) {
      .sidebar {
        height: auto;
        padding: 10px;
      }
    }
  </style>
</head>

<body>
  <nav class="navbar navbar-light bg-light d-md-none px-3">
    <button class="btn btn-outline-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu">
      メニュー
    </button>
  </nav>

  <div class="d-md-flex">
    <div class="collapse d-md-block" id="sidebarMenu">
      <div class="sidebar">
        <h5>メニュー</h5>
        <a href="create.html">新規作成</a>
        <a href="task.jsp">タスク一覧</a>
        <br>
        <a href="index.html" class="btn btn-outline-danger mt-4">ログアウト</a>
      </div>
    </div>

    <div class="content">
      <div class="text-end mb-3">こんにちは、<strong>${sessionScope.username}</strong> 様</div>

      <h3 class="text-center">タスク一覧</h3>

      <div class="table-wrapper mx-auto" style="max-width: 1000px; width: 100%;">
        <table class="table table-bordered table-sm table-hover text-center align-middle">
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
            <c:forEach var="t" items="${todos}">
              <tr>
                <td><input type="checkbox" ${t.done ? "checked" : ""} disabled /></td>
                <td>${t.title}</td>
                <td>${t.dueDate}</td>
                <td>${t.assignee}</td>
                <td class="text-nowrap">
                  <button class="btn btn-sm btn-outline-primary me-1" disabled>編集</button>
                  <button class="btn btn-sm btn-outline-danger me-1" disabled>削除</button>
                  <button class="btn btn-sm btn-outline-info" disabled>詳細</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>

</html>
