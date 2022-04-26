package main.java;

import main.java.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DAO {
	
	public static int registerUser (User user) throws ClassNotFoundException {
		String sqlString = "INSERT INTO users " + 
				"(user_id, user_name, user_img_url, user_email) VALUES " + "(?, ?, ?, ?)";
		int result = 0;
		
		try (Connection connection = JDBCUtil.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(sqlString);
			statement.setString(1,  user.getId());
			statement.setString(2,  user.getName());
			statement.setString(3,  user.getImgUrl());
			statement.setString(4,  user.getEmail());
			
			result = statement.executeUpdate();
			
			connection.close();
		} catch (SQLException e) {
            e.printStackTrace();
		} 
		
		return result;
	}
	
}