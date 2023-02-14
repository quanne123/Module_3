package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {

        private static String jdbcURL = "jdbc:mysql://localhost:3306/quan_ly_user";
        private static String jdbcUsername = "root";
        private static String jdbcPassword = "123456";
        private static Connection connection;

        public static Connection getConnection() {
            if (connection == null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            return connection;
        }
    }

