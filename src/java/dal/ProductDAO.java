/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import utils.DBUtils;

/**
 *
 * @author SHD
 */
public class ProductDAO {

    public static List<Product> getProducts(String search, String category) {
        List<Product> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select  p.PID,p.PName,p.price,p.imgPath,p.description,p.status,p.CateID,c.CateName from Products p,Categories c where p.CateID = c.CateID and p.PName like ? ";

                if (category != null ) {
                    sql += " and c.cateID like '%" + category + "%'";
                }

                PreparedStatement stm = cn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Product plant = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                    list.add(plant);
                }
             
            }
        } catch (Exception e) {

        }
           return list;

    }

    public static Product getProduct(int pid) {
        Product plant = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select  p.PID,p.PName,p.price,p.imgPath,p.description,p.status,p.CateID,c.CateName from Products p,Categories c where p.CateID = c.CateID AND PID = ?";

                PreparedStatement stm = cn.prepareStatement(sql);
                stm.setInt(1, pid);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    plant = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));

                }
                return plant;
            }
        } catch (Exception e) {

        }
        return plant;

    }

    public static boolean updateProduct(Product dto) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;

        String UPDATE = "UPDATE Products SET PName=?, price=?, imgPath=?, description=?, status=?, CateID=? WHERE PID=?";

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE);

                stm.setString(1, dto.getName());
                stm.setInt(2, dto.getPrice());
                stm.setString(3, dto.getImgPath());
                stm.setString(4, dto.getDescription());
                stm.setInt(5, dto.getStatus());
                stm.setInt(6, dto.getCateid());
                stm.setInt(7, dto.getId());
                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return result;
    }

    public static boolean insertProduct(Product dto) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;

        String INSERT = "insert into Products(PName, price, imgPath, description, status, CateID) values(?,?,?,?,?,?)";

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT);
                stm.setString(1, dto.getName());
                stm.setInt(2, dto.getPrice());
                stm.setString(3, dto.getImgPath());
                stm.setString(4, dto.getDescription());
                stm.setInt(5, dto.getStatus());
                stm.setInt(6, dto.getCateid());

                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return result;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.println(getProducts("", "byname"));
    }
}
