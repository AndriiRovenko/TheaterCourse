package dao;

import model.Operation;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by andrew on 6/4/16.
 */
public class OperationDAO {
    public int insert(Operation operation) {
        Integer addressGeneratedId = null;
        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO "
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
