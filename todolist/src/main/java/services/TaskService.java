package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import beans.Task;
import utils.Db;

public class TaskService {

	public List<Task> selectAll() {

		List<Task> tasks = new ArrayList<>();

		String sql = "SELECT * FROM tasks ORDER BY done";

		try (Connection con = Db.open();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Task task = new Task(
						rs.getString("title"),
						rs.getDate("due_date").toLocalDate(),
						rs.getString("assignee"));
				task.setId(rs.getInt("id"));
				task.setDone(rs.getBoolean("done"));
				Timestamp ts = rs.getTimestamp("completed_at");
				if (ts != null) {
					task.setCompletedAt(ts.toLocalDateTime());
				}
				tasks.add(task);
			}
			System.out.println("取得件数：" + tasks.size());

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
			ps.setBoolean(4, task.isDone());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Task selectById(int id) {
		String sql = "SELECT * FROM tasks WHERE id = ?";

		try (Connection con = Db.open();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					Task task = new Task(
							rs.getString("title"),
							rs.getDate("due_date").toLocalDate(),
							rs.getString("assignee"));
					task.setId(rs.getInt("id"));
					task.setDone(rs.getBoolean("done"));

					Timestamp ts = rs.getTimestamp("completed_at");
					if (ts != null) {
						task.setCompletedAt(ts.toLocalDateTime());
					}

					return task;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void update(Task task) {
		String sql = "UPDATE tasks SET title = ?, due_date = ?, assignee = ?, done = ?, completed_at = ? WHERE id = ?";

		try (
				Connection con = Db.open();
				PreparedStatement ps1 = con.prepareStatement("SELECT * FROM tasks WHERE id = ?");
				PreparedStatement ps2 = con.prepareStatement(sql)) {

			ps1.setInt(1, task.getId());
			ResultSet rs = ps1.executeQuery();
			boolean done = false;
			if (rs.next()) {
				done = rs.getBoolean("done");
			}

			ps2.setString(1, task.getTitle());
			ps2.setDate(2, Date.valueOf(task.getDueDate()));
			ps2.setString(3, task.getAssignee());
			ps2.setBoolean(4, done);// 引き継いだ値を使用

			if (done) {
				ps2.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
			} else {
				ps2.setNull(5, java.sql.Types.TIMESTAMP);
			}

			ps2.setInt(6, task.getId());

			ps2.executeUpdate();
			System.out.println("更新: " + task.getId() + ", " + task.getTitle() + ", " + task.getAssignee());


		} catch (Exception se) {
			se.printStackTrace();
		}
	}

	public void updateDoneStatus(int id, boolean done) {
		String sql = "UPDATE tasks SET done = ?, completed_at = ? WHERE id = ?";

		try (Connection con = Db.open();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setBoolean(1, done);

			if (done) {
				ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
			} else {
				ps.setNull(2, java.sql.Types.TIMESTAMP);
			}

			ps.setInt(3, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		String sql = "delete from tasks where id = ?";

		try (
				Connection con = Db.open();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		}
	}

}
