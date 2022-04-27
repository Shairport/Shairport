package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @brief creates a connection to MySQL database using the JDBC Driver
 */
public class JDBCUtil {
    /**
     * @brief gets a database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
       
        try {
        	String user = "root";
        	String password = "root";
        	String url = "jdbc:mysql://localhost:3306/Shairport";
            
            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}