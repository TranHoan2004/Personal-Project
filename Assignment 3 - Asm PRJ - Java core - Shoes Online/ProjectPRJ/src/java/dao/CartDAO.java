/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CartDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CartDAO() {
        this.conn = null;
        this.ps = null;
        this.rs = null;
    }

    public Cart getCart(int accountID, int productID, String size) {
        String query = """
                       select * from Cart\r
                       where [accountID] = ? and [productID] = ? and [size]= ?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setString(3, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception exception) {
        }
        return null;
    }

    public void createAmountAndSizeCart(int accountID, int productID, int amount, String size) {
        String query = """
                       update Cart set [amount]=?,\r
                       [size]=?\r
                       where [accountID]=? and [productID]=?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setString(2, size);
            ps.setInt(3, accountID);
            ps.setInt(4, productID);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void createCart(int accountID, int productID, int amount, String size) {
        String query = """
                       insert Cart(accountID, productID, amount,size)\r
                       values(?,?,?,?)""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.setString(4, size);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void deleteCart(int productID) {
        String query = "delete from Cart where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void updateAmountCart(int accountID, int productID, int amount) {
        String query = """
                       update Cart set [amount]=?\r
                       where [accountID]=? and [productID]=?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public String getAmountCart(String user) {
        String count = "Oke"; // Giá trị mặc định nếu không tìm thấy dữ liệu
        String query = "SELECT COUNT(*) FROM Cart c "
                + "INNER JOIN Account a  ON a.uID = c.accountID "
                + "WHERE [user] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần
        } finally {
            // Đóng kết nối và các tài nguyên (ps, rs) ở đây nếu cần
        }
        return count;
    }

    public List<Cart> getCartByAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        String query = "select * from Cart where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception exception) {
        }
        return list;
    }

    public void deleteCartByAccountID(int id) {
        String query = "delete cart  where accountid = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void deleteCartByProductID(String productID) {
        String query = "delete from Cart where [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }

    public void insertCart(int accountID, int productID, int amount, String size) {
        String query = """
                       insert Cart(accountID, productID, amount,size)\r
                       values(?,?,?,?)""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.setString(4, size);
            ps.executeUpdate();
        } catch (Exception exception) {
        }
    }
}
