import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DAO {
    private static Connection conn;

    DAO () {
        conn = null;
    }

    public static void openConnection() throws SQLException {
        conn = JDBCUtil.getConnection();
    }

    public static void closeConnection() throws SQLException {
        conn.close();
    }

	public static int addUser(User user) throws SQLException {
        openConnection();
		
		String sqlString = "INSERT INTO users (user_id, user_name, user_img_url, user_email) VALUES (?, ?, ?, ?)";
		int result = 0;

        try {
			PreparedStatement statement = conn.prepareStatement(sqlString);
			statement.setString(1,  user.getId());
			statement.setString(2,  user.getName());
			statement.setString(3,  user.getImgUrl());
			statement.setString(4,  user.getEmail());
			
			result = statement.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} 

        closeConnection();
		return result;
	}
}
//this is a test to see if i can push from eclipse