package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import beans.Todo;
import utils.Db;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TaskServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Todo> todos = new ArrayList<>();

		try (Connection con = Db.open()) {
			String sql = "SELECT title, assignee, due_date, done FROM todos ORDER BY due_date";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Todo todo = new Todo();
				todo.setTitle(rs.getString("title"));
				todo.setAssignee(rs.getString("assignee"));
				todo.setDueDate(rs.getDate("due_date").toLocalDate());
				todo.setDone(rs.getBoolean("done"));
				todos.add(todo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
			return;
		}

		request.setAttribute("todos", todos);
		request.getRequestDispatcher("/task.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
