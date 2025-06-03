package beans;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Task {

	private int id;
	private String title;
	private LocalDate dueDate;
	private String assignee;
	private boolean done;
	private LocalDate created_at;
	private LocalDate completed_at_at;

	public Task(String title, LocalDate dueDate, String assignee) {
		this.title = title;
		this.dueDate = dueDate;
		this.assignee = assignee;
	}
	
	
	public Task(int id, String title, LocalDate dueDate, String assignee) {
	    this.id = id;
	    this.title = title;
	    this.dueDate = dueDate;
	    this.assignee = assignee;
	}




	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public boolean isDone() {
		return done;
	}

	public void setDone(boolean done) {
		this.done = done;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}



	public LocalDate getCompleted_at_at() {
		return completed_at_at;
	}



	public void setCompleted_at_at(LocalDate completed_at_at) {
		this.completed_at_at = completed_at_at;
	}



	public LocalDate getCreated_at() {
		return created_at;
	}



	public void setCreated_at(LocalDate created_at) {
		this.created_at = created_at;
	}



	public int getId() {
	    return id;
	}

	public void setId(int id) {
	    this.id = id;
	}



	public void setCompletedAt(LocalDateTime localDateTime) {
		// TODO 自動生成されたメソッド・スタブ
		
	}








}
