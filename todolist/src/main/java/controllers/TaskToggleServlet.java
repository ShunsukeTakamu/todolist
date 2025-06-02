package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import services.TaskService;

/**
 * Servlet implementation class TaskToggleServlet
 */
@WebServlet("/TaskToggleServlet")
public class TaskToggleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskToggleServlet() {
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
		int taskId = Integer.parseInt(request.getParameter("taskId"));
		boolean done = request.getParameter("done") != null;
		
		TaskService service = new TaskService();
		service.updateDoneStatus(taskId, done);
//		System.out.println("aaa");
		String taskIdStr = request.getParameter("taskId");
		String doneStr = request.getParameter("done");
		System.out.println("受信 taskId = " + taskIdStr);
		System.out.println("受信 done = " + doneStr);
		response.sendRedirect("TaskServlet");
	}

}
