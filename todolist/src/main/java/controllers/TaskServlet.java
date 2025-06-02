package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import beans.Task;
import services.TaskService;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TaskServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		TaskService service = new TaskService();
		List<Task> tasks = service.selectAll();

		request.setAttribute("tasks", tasks);
		request.getRequestDispatcher("/task.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String title = request.getParameter("title");
		LocalDate dueDate = LocalDate.parse(request.getParameter("dueDate"));
		String assignee = request.getParameter("assignee");

		
		Task task = new Task(title, dueDate, assignee);

		TaskService service = new TaskService();
		service.insert(task);

		response.sendRedirect("TaskServlet");
	}

}
