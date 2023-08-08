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
import model.Account;
import utils.DBUtils;

/**
 *
 * @author SHD
 */
public class AccountDAO {

    public static Account checkLogin(String email, String password)  {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String LOGIN = "SELECT * FROM Accounts WHERE email=? AND password=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(LOGIN);
                ps.setString(1, email);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    int status = rs.getInt("status");
                    String phone = rs.getString("phone");
                    int role = rs.getInt("role");
                    return new Account(AccID, Email, Password, fullname, status, phone, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
   
        }
        return null;
    }

    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole)  {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Accounts(email, password, fullname, phone, status, role) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newEmail);
                pstmt.setString(2, newPassword);
                pstmt.setString(3, newFullname);
                pstmt.setString(4, newPhone);
                pstmt.setInt(5, newStatus);
                pstmt.setInt(6, newRole);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return false;
    }

    public static ArrayList<Account> getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();

        Connection connection;
        String sql = "SELECT * FROM Accounts";

        try {
            connection = DBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int accID = resultSet.getInt("accID");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullname = resultSet.getString("fullname");
                String phone = resultSet.getString("phone");
                int status = resultSet.getInt("status");
                int role = resultSet.getInt("role");

                Account account = new Account(accID, email, password, fullname, status, phone, role);
                accounts.add(account);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accounts;
    }

    public static Account getAccount(String token) throws Exception {
        Account accounts = null;

        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM Accounts WHERE token = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, token);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int accID = resultSet.getInt("accID");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullname = resultSet.getString("fullname");
                String phone = resultSet.getString("phone");
                int status = resultSet.getInt("status");
                int role = resultSet.getInt("role");

                Account account = new Account(accID, email, password, fullname, status, phone, role);
                accounts = account;
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accounts;
    }

    public static boolean updateAccountStatus(String email, int status) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Accounts SET status = ? WHERE email = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, status);
                pstmt.setString(2, email);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public static boolean updateToken(String token, String email) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Accounts SET token = ? WHERE email = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, token);
                pstmt.setString(2, email);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public static boolean updateAccount(String email, String newPassword, String newFullname, String newPhone)  {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Accounts SET password = ?, fullname = ?, phone = ? WHERE email = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, newFullname);
                pstmt.setString(3, newPhone);
                pstmt.setString(4, email);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
     
        }
        return false;
    }

    public static ArrayList<Account> searchAccounts(String search) {
        ArrayList<Account> accounts = new ArrayList<>();

        Connection connection;
        String sql = "SELECT * FROM Accounts WHERE fullname like ?";

        try {
            connection = DBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int accID = resultSet.getInt("accID");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullname = resultSet.getString("fullname");
                String phone = resultSet.getString("phone");
                int status = resultSet.getInt("status");
                int role = resultSet.getInt("role");

                Account account = new Account(accID, email, password, fullname, status, phone, role);
                accounts.add(account);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accounts;
    }

}
