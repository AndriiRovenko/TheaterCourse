package dao;

import model.Contragent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by andrew on 6/4/16.
 */
public class ContragentDAO {

    public int insert (Contragent contragent) {
        Integer addressGeneratedId = null;
        try {
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement psAgent = connection.prepareStatement(
                    "INSERT INTO agent VALUES (DEFAULT, ?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            PreparedStatement psContragentCategory = connection.prepareStatement(
                    "INSERT INTO contragent_category VALUES (DEFAULT, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            PreparedStatement psState = connection.prepareStatement(
                    "INSERT INTO state VALUES (DEFAULT, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            int tmpInt;
            ResultSet resultSet = psState.executeQuery("SELECT * FROM state");
            while (resultSet.next()) {
                tmpInt = resultSet.getInt("state_id");
            }


            PreparedStatement psLocation = connection.prepareStatement(
                    "INSERT INTO location VALUES (DEFAULT, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );
            psAgent.setString(1, contragent.getAgent().getFirstName());
            psAgent.setString(2, contragent.getAgent().getLastName());
            psAgent.setString(3, contragent.getAgent().getPhone());
            psAgent.setString(4, contragent.getAgent().getMail());
            psAgent.setString(5, contragent.getAgent().getEdrpu());
            psAgent.executeUpdate();

            psContragentCategory.setString(1, contragent.getCategory().getName());

            psState.setString(1, contragent.getLocation().getState().getName());

            psLocation.setString(1, contragent.getLocation().getName());


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
/*
    public Contragent findById(int contragentId) {
        Connection connection = new DatabaseConnection();

        Contragent tmpContragent = new Contragent();

    }
*/
}
