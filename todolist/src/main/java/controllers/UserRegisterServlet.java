package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import utils.Db;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 新規登録ページに遷移（GETアクセス対応）
		request.getRequestDispatcher("/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");

		if (!password.equals(confirm)) {
			request.setAttribute("error", "パスワードが一致しません！");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}

		try (Connection con = Db.open()) {
			String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password); // 実運用ではハッシュ化を推奨

			ps.executeUpdate();

			// 登録成功後にログインページへリダイレクト
			response.sendRedirect(request.getContextPath() + "/login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}
}
