/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public AccountDAO() {
        this.conn = null;
        this.ps = null;
        this.rs = null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "Select * from Account ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account getAccountId(String id) {
        String query = "Select * from Account  where [uid] =? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6));
            }
        } catch (Exception exception) {
        }
        return null;
    }

    public void updateProfile(String username, String password, String email, int uID) {
        String query = """
                       update Account set [user]=?,\r
                       [pass]=?,\r
                       [email]=?\r
                       where [uID] = ?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, uID);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public Account login(String user, String pass) {
        String query = """
                        select * from account
                       where [user] = ? 
                       and pass = ?""";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)
                );
            }
        } catch (Exception exception) {
        }
        return null;
    }

    public Account checkAccounExist(String user) {
        String query = """
                       Select * from Account
                       where [user] = ?
                       """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6));
            }
        } catch (Exception exception) {
        }
        return null;
    }

    public void insertAccount(String user, String pass, String isSell, String isAdmin, String email) {
        String query = """
                       insert Account([user], pass, isSell, isAdmin, email)\r
                       values(?,?,?,?,?)""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, isSell);
            ps.setString(4, isAdmin);
            ps.setString(5, email);
            ps.executeUpdate();
        } catch (Exception exception) { 
        }
    }

    public List<Account> getListByPageAccount(List<Account> list, int start, int end) {
        ArrayList<Account> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void deleteAccount(String id) {
        String query = "delete from Account where uID= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void editAccount(String username, String password, int isSell, int isAdmin, String email, int uID) {
        String query = """
                       update Account set [user]= ?,
                                     [pass]= ?,
                                     [isSell] = ?,
                                     [isAdmin] =   ?   ,        
                                     [email]= ?
                                      where uID= ?
                       """;
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            ps.setString(5, email);
            ps.setInt(6, uID);
            ps.executeUpdate();
        } catch (Exception exception) { 
        }
    }

    public void CreateSignIn(String user, String pass) {
        String query = """
                       insert into account
                       values(?,?,0,0,0)""";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public Account CheckAccounExist(String user) {
        String query = """
                       Select * from Account
                       where [user] = ?
                       """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6));
            }
        } catch (Exception exception) { 
        }
        return null;
    }
}
