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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("name");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		
		request.getSession().setAttribute("username", username);
		response.sendRedirect(request.getContextPath() + "/TaskServlet");

		if (!password.equals(confirm)) {
			request.setAttribute("error", "パスワードが一致しません！");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
			return;
		}

		try (Connection con = Db.open()) {
			String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeUpdate();

			response.sendRedirect(request.getContextPath() + "/task.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
