package controllers;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import beans.Task;
import services.TaskService;

/**
 * Servlet implementation class TaskUpdateServlet
 */
@WebServlet("/TaskUpdateServlet")
public class TaskUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String title= request.getParameter("title");
		LocalDate dueDate = LocalDate.parse(request.getParameter("dueDate"));
		String assignee = request.getParameter("assignee");
		
		Task task = new Task(id, title, dueDate, assignee);
		
		TaskService service = new TaskService();
		Task original = service.selectById(id);
		if(original == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND,"該当するタスクが見つかりません");
			return;
		}
		task.setDone(original.isDone());
		service.update(task);
		response.sendRedirect("TaskServlet");
		
		
	}

}
