package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Todo;
import utils.Db;

public class Service {

    public List<Todo> selectAll() {
        List<Todo> todos = new ArrayList<>();
        String sql = "SELECT * FROM todos ORDER BY due_date";

        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                todos.add(new Todo(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getDate("due_date").toLocalDate(),
                    rs.getString("assignee"),
                    rs.getBoolean("done")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return todos;
    }

    public int insert(Todo todo) {
        String sql = "INSERT INTO todos (title, due_date, assignee, done) VALUES (?, ?, ?, false)";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, todo.getTitle());
            ps.setDate(2, Date.valueOf(todo.getDueDate()));
            ps.setString(3, todo.getAssignee());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
