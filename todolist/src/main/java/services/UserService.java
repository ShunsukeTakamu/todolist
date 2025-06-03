package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.Db;

public class UserService {

	public void register(String username, String password,String mail) throws Exception {
		try (Connection con = Db.open()) {
			String checkSql = "SELECT username FROM users WHERE username = ?";
			try(PreparedStatement check = con.prepareStatement(checkSql)){
				
				check.setString(1, username);
				var rs = check.executeQuery();
				if(rs.next()) {
					throw new Exception("氏名がすでに使われています");
				}
			}
			String sql = "INSERT INTO users (username, password, mail) VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, mail);
			ps.executeUpdate();
			
		}  catch (SQLException e) {
	        if (e.getErrorCode() == 1062) {
	            throw new Exception("ユーザー名が既に使われています");
	        } 
	    }
	}
}

