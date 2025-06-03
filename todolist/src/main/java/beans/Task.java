package beans;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor
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

}