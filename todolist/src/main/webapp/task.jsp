<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>タスク一覧</title>
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
    <!-- siedbar -->
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
                <a href="list2.html">タスク一覧</a>
                <br>
                <a href="index.html" class="btn btn-outline-danger mt-4">ログアウト</a>

            </div>
        </div>



        <!-- main -->
        <div class="content">
            <div class="text-end mb-3" id="welcomeArea">こんにちは、〇〇〇〇様</div>
            <h3 class="text-center">タスク一覧</h3>
            <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
                <button class="btn btn-secondary" onclick="toggleForm()">＋追加</button>
            </div>

            <!-- 入力フォーム -->
            <form id="addForm" class="row g-2 mb-4 d-none" onsubmit="addTask(event)">
                <div class="col-12 col-md-3">
                    <input type="text" id="taskName" class="form-control" placeholder="タスク名" required />
                </div>
                <div class="col-6 col-md-3">
                    <input type="date" id="dueDate" class="form-control" required />
                </div>
                <div class="col-6 col-md-3">
                    <input type="text" id="assignee" class="form-control" placeholder="担当者" required />
                </div>
                <div class="col-12 col-md-3 d-grid">
                    <button type="submit" class="btn btn-primary">追加</button>
                </div>
            </form>


            <div class="table-wrapper mx-auto" style="max-width: 1000px; width: 100%; padding: 0 10px;">
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
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>会議資料作成</td>
                            <td>2025-04-01</td>
                            <td>田中</td>
                            <td class="text-nowrap">
                                <button class="btn btn-sm btn-outline-primary me-1">編集</button>
                                <button class="btn btn-sm btn-outline-danger me-1">削除</button>
                                <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                    data-bs-target="#taskModal1">詳細</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>資格試験</td>
                            <td>2025-06-02</td>
                            <td>伊藤</td>
                            <td class="text-nowrap">
                                <button class="btn btn-sm btn-outline-primary me-1">編集</button>
                                <button class="btn btn-sm btn-outline-danger me-1">削除</button>
                                <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                    data-bs-target="#taskModal2">詳細</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>お弁当</td>
                            <td>2025-04-30</td>
                            <td>加藤</td>
                            <td class="text-nowrap">
                                <button class="btn btn-sm btn-outline-primary me-1">編集</button>
                                <button class="btn btn-sm btn-outline-danger me-1">削除</button>
                                <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                    data-bs-target="#taskModal3">詳細</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" checked></td>
                            <td>資料作成</td>
                            <td>2025-05-01</td>
                            <td>鈴木</td>
                            <td class="text-nowrap">
                                <button class="btn btn-sm btn-outline-primary me-1">編集</button>
                                <button class="btn btn-sm btn-outline-danger me-1">削除</button>
                                <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                    data-bs-target="#taskModal4">詳細</button>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>
        <!-- モーダル　詳細 -->
        <!-- モーダル1：会議資料作成 -->
        <div class="modal fade" id="taskModal1" tabindex="-1" aria-labelledby="taskModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="taskModalLabel1">タスク詳細</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="閉じる"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>タスク名：</strong>会議資料作成</p>
                        <p><strong>期限：</strong>2025-04-01</p>
                        <p><strong>担当者：</strong>田中</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- モーダル2：資格試験 -->
        <div class="modal fade" id="taskModal2" tabindex="-1" aria-labelledby="taskModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="taskModalLabel2">タスク詳細</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="閉じる"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>タスク名：</strong>資格試験</p>
                        <p><strong>期限：</strong>2025-06-02</p>
                        <p><strong>担当者：</strong>伊藤</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- モーダル3：お弁当 -->
        <div class="modal fade" id="taskModal3" tabindex="-1" aria-labelledby="taskModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="taskModalLabel3">タスク詳細</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="閉じる"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>タスク名：</strong>お弁当</p>
                        <p><strong>期限：</strong>2025-04-30</p>
                        <p><strong>担当者：</strong>加藤</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- モーダル4：資料作成 -->
        <div class="modal fade" id="taskModal4" tabindex="-1" aria-labelledby="taskModalLabel4" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="taskModalLabel4">タスク詳細</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="閉じる"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>タスク名：</strong>資料作成</p>
                        <p><strong>期限：</strong>2025-05-01</p>
                        <p><strong>担当者：</strong>鈴木</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
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
              <button class="btn btn-sm btn-outline-danger" disabled>削除</button>
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