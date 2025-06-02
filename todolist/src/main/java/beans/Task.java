package beans;

import java.time.LocalDate;

public class Task {
	private String title;
	private LocalDate dueDate;
	private String assignee;
	private boolean done;

	public Task(String title, LocalDate dueDate, String assignee) {
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

}
