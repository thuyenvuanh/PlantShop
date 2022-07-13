/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import dtos.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author anhthuyn
 */
public class AccountDAO {

    public static ArrayList<Account> getAccounts() {
     
        ArrayList<Account> list = new ArrayList();
        
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from Accounts";
            ResultSet rs = connection.createStatement().executeQuery(sql);
            while (rs != null && rs.next()) {                
                list.add(new Account(
                        rs.getInt("accID"),
                        rs.getInt("status"),
                        rs.getInt("role"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("Phone")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static Account getAccount(String email, String password) {

        Account account = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where status = 1 and email = ? and password = ? COLLATE Latin1_General_CS_AS";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs != null && rs.next()) {
                account = new Account(
                        rs.getInt("accID"),
                        rs.getInt("status"),
                        rs.getInt("role"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("Phone"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return account;
    }
    
    public static Account getAccount(String token) {

        Account account = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where status = 1 and token = ? COLLATE Latin1_General_CS_AS";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            if (rs != null && rs.next()) {
                account = new Account(
                        rs.getInt("accID"),
                        rs.getInt("status"),
                        rs.getInt("role"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("Phone"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return account;
    }

    public static boolean updateAccountStatus(String email, int status) {
        boolean result = false;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "update accounts\n"
                    + "set status = ?\n"
                    + "where email = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setString(2, email);
            int row = statement.executeUpdate();
            result = (row > 0);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return result;
    }

    public static boolean updateAccount(String email, String newPassword, String newFullName, String newPhone) {
        boolean result = false;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "update accounts\n"
                    + "set password=?,fullname=?,phone=?\n"
                    + "where email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, newPassword);
            statement.setString(2, newFullName);
            statement.setString(3, newPhone);
            statement.setString(4, email);

            int row = statement.executeUpdate();
            result = row > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return result;
    }

    public static boolean insertAccount(String email, String password, String fullname, String phone, int status, int role) {
        boolean result = false;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "insert into Accounts\n"
                    + "values (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setString(4, phone);
            statement.setInt(5, status);
            statement.setInt(6, role);
            int row = statement.executeUpdate();
            result = row > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return result;
    }
    
    public static boolean updateToken(String email, String token){
        boolean result = false;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "update accounts\n"
                    + "set Token=?\n"
                    + "where email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, token);
            statement.setString(2, email);
            int row = statement.executeUpdate();
            result = row > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return result;
    }
}
