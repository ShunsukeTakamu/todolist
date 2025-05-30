<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新規登録</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">
    <h2 class="mt-5">新規登録</h2>
    <form action="UserRegisterServlet" method="post">
      <div class="mb-3">
        <label>氏名</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>メール</label>
        <input type="email" name="email" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>パスワード</label>
        <input type="password" name="password" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>パスワード確認</label>
        <input type="password" name="confirm" class="form-control" required>
      </div>
      <button type="submit" class="btn btn-success">登録</button>
    </form>

    <p class="mt-3">すでにアカウントをお持ちの方は <a href="login.jsp">ログイン</a></p>
  </div>
</body>
</html>
