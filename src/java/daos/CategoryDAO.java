/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author thuyn
 */
public class CategoryDAO {
    
    public static ArrayList<Category> getCategories() {
        ArrayList<Category> result = new ArrayList<>();
        Connection connection = null;
        try {
            connection = DBUtils.getConnection();
            String sql = "SELECT CateID, CateName FROM Categories";
            ResultSet rs = connection.createStatement().executeQuery(sql);
            while (rs.next()) {                
                result.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Query category error: " + e.getMessage());
        }
        return result;
    }
    
    public static ArrayList<Category> searchByName(String keyword) {
        ArrayList<Category> result = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            String sql = "SELECT CateID, CateName FROM Categories WHERE CateName like ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                result.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Query category error: " + e.getMessage());
        }
        return result;
    }
    
}
