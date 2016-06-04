package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * Created by andrew on 6/4/16.
 */
public final class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/theater_course";
    private static final String DRIVER = "org.postgresql.Driver";
    private static DatabaseConnection instance = null;
    private static Connection conn = null;

    public static void createConnection(String username, String password){
        if ((username == null || password == null)) throw new IllegalArgumentException("User or password is null!");
        try {
            conn = DriverManager.getConnection(URL, username, password);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
    }


    public static Connection getConnection() throws Exception {
        if(conn == null) throw new Exception("Connection isn't established");
        return conn;
    }

    private DatabaseConnection() {
    }
}
