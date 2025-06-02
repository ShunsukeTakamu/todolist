package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Task;
import utils.Db;

public class TaskService {

	
	public List<Task> selectAll() {
		
		List<Task> tasks = new ArrayList<>();
		
		String sql = "SELECT * FROM tasks ORDER BY due_date";
		System.out.println("取得件数：" + tasks.size());
		try (Connection con = Db.open();
		     PreparedStatement ps = con.prepareStatement(sql);
		     ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Task task = new Task(
					rs.getString("title"),
					rs.getDate("due_date").toLocalDate(),
					rs.getString("assignee")
				);
				task.setDone(rs.getBoolean("done"));
				tasks.add(task);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return tasks;
	}

	public void insert(Task task) {
		String sql = "INSERT INTO tasks (title, due_date, assignee, done) VALUES (?, ?, ?, false)";
		try (Connection con = Db.open();
		     PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, task.getTitle());
			ps.setDate(2, Date.valueOf(task.getDueDate()));
			ps.setString(3, task.getAssignee());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
