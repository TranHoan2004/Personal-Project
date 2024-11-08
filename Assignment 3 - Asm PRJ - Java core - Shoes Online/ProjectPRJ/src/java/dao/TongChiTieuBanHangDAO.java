/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class TongChiTieuBanHangDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public TongChiTieuBanHangDAO() {
        this.conn = null;
        this.ps = null;
        this.rs = null;
    }

    public void deleteTongChiTieuBanHangByUserID(String id) {
        String query = """
                       delete from TongChiTieuBanHang
                       where [userID] = ?""";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception exception) { 
        }
    }
}
