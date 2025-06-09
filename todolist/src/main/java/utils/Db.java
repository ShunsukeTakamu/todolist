package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.NamingException;

public class Db {
	
	public static Connection open() throws SQLException, NamingException {
	    try {
	        // 明示的に MariaDB JDBC ドライバをロード
	        Class.forName("org.mariadb.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        System.out.println("JDBCドライバが見つかりません: " + e.getMessage());
	        throw new SQLException("JDBCドライバが見つかりません", e);
	    }
     
	    Connection con = null;
	    try {
	        con = DriverManager.getConnection("jdbc:mariadb://192.168.5.172:3306/todo_app", "root", "root");// localhost
	        System.out.println("データベース接続成功");
	    } catch (SQLException e) {
	        System.out.println("データベース接続失敗: " + e.getMessage());
	        throw e;
	    }
	    return con;
	}

}
