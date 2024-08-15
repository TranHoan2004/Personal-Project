/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO {

    private final Connection connection;
    private String status;

    public AccountDAO() {
        this.connection = new DBContext().connection;
        this.status = "OK";
    }

    public void createInformation(Account account) throws SQLException {
        String sql = "insert into dbo.Account (id, password, name, house_num, city, phone_number, email, role_id)"
                + "values (?,?,?,?,?,?,?,?)";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, account.getId());
        pre.setString(2, account.getPassword());
        pre.setString(3, account.getName());
        pre.setString(4, account.getHouse_num());
        pre.setString(5, account.getCity());
        pre.setString(6, account.getPhone_number());
        pre.setString(7, account.getEmail());
        pre.setInt(8, account.getRole());
        pre.executeUpdate();
    }

    public void updateInformation(Account account) {

    }

    public void deleteInformation(Account account) {

    }

    public Account getUserByEmail(String email_raw) throws SQLException {
        String sql = """
                     select *
                     from Account a
                     where a.email = ?
                     """;
        Account user = null;
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, email_raw);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String password = rs.getString("password");
            String name = rs.getString("name");
            String house_num = rs.getString("house_num");
            String city = rs.getString("city");
            String phone_number = rs.getString("phone_number");
            String email = rs.getString("email");
            int role_id = rs.getInt("role_id");
            user = new Account(id, password, name, house_num, city, phone_number, email, role_id);
        }
        return user;
    }
}
