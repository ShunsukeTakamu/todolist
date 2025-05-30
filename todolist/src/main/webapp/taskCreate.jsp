<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- sidebar -->
    <div class="collapse d-md-block" id="sidebarMenu">
      <div class="sidebar">
        <h5>メニュー</h5>
        <a href="create.html">新規作成</a>
        <a href="list2.html">タスク一覧</a>
        <br>
        <a href="index.html" class="btn btn-outline-danger mt-4">ログアウト</a>
      </div>
    </div>

    <!-- main -->
    <div class="content">
      <div class="text-end mb-3" id="welcomeArea">こんにちは、〇〇〇〇様</div>

      <h3 class="text-center">タスクの新規作成</h3>
      <form action="list2.html" class="mt-4">
        <div class="mb-3">
          <label class="form-label">タスク名</label>
          <input type="text" class="form-control" placeholder="タスク名" required>
        </div>
        <div class="mb-3">
          <label class="form-label">期限</label>
          <input type="date" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">担当者</label>
          <input type="text" class="form-control" placeholder="名前" required>
        </div>
        <button type="submit" class="btn btn-secondary">保存して一覧へ</button>
      </form>
    </div>
  </div>

</body>

</html>