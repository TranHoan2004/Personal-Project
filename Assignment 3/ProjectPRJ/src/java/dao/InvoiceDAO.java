/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class InvoiceDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public InvoiceDAO() {
        this.conn = null;
        this.ps = null;
        this.rs = null;
    }

    public void insertInvoice(int accountID, double tongGia, String context, int phone, String delivery, String name, String typepay) {
        String query = "INSERT INTO invoice(accountID, tongGia, ngayXuat, context, typepay, phone, delivery, [name]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, tongGia);
            ps.setDate(3, getCurrentDate());
            ps.setString(4, context);
            ps.setString(5, typepay);
            ps.setInt(6, phone);
            ps.setString(7, delivery);
            ps.setString(8, name);
            ps.executeUpdate();
        } catch (Exception exception) { 
        }
        System.out.println("oke");
    }

    public List<Invoice> getAllInvoiceByid(int accountID) {
        String query = """
                       select*from invoice \r
                       where accountid = ? """;
        List<Invoice> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception exception) {
        }
        return list;
    }

    public List<Invoice> getAllInvoiceByID(int id) {
        List<Invoice> list = new ArrayList<>();
        String query = " Select * from Invoice where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception exception) {
        }
        return list;
    }

    public void deleteInvoiceByAccountId(String id) {
        String query = """
                       delete from Invoice
                       where [accountID] = ?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime()); 
    }
}
