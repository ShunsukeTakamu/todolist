package beans;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Todo {
    private int id;
    private String title;
    private LocalDate dueDate;
    private String assignee;
    private boolean done;
}
