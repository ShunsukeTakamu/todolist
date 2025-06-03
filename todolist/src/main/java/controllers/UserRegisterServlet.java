	package controllers;
	
	import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import services.UserService;
	
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
			String mail = request.getParameter("mail");
			String password = request.getParameter("password");
			String confirm = request.getParameter("confirm");
	
			if (!password.equals(confirm)) {
				request.setAttribute("error", "パスワードが一致しません！");
				request.getRequestDispatcher("/signup.jsp").forward(request, response);
				return;
			}
	
			UserService service = new UserService();
			try {
				service.register(username, password,mail);
				request.getSession().setAttribute("username", username);
				response.sendRedirect(request.getContextPath() + "/TaskServlet");
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/signup.jsp").forward(request, response);
			}
		}
	
	}
