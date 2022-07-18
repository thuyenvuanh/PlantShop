/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import dtos.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class PlantDAO {

    public static ArrayList<Plant> searchPlant(String keyword, String searchBy) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            String sql = "SELECT PID, [PName], price, imgPath, [description], [status], Categories.CateID as CateID, CateName\n"
                    + "FROM dbo.Plants join dbo.Categories on Plants.CateID = Categories.CateID\n";
            if (searchBy.equalsIgnoreCase("byname")) {
                sql += "WHERE [PName] like ?";
            } else {
                sql += "WHERE CateName like ?";
            }
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Plant(rs.getInt("PID"), rs.getString("PName"), rs.getInt("price"), rs.getString("imgPath"), rs.getString("description"), rs.getInt("status"), rs.getInt("CateID"), rs.getString("CateName")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                ps.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static void updatePlantStatus(int id, int status) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            connection.setAutoCommit(false);
            String sql = "Update dbo.Plants \n"
                    + "Set Status = ? \n"
                    + "WHERE PID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static Plant getById(int id) {
        Plant plant = null;
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            String sql = "SELECT PID, [PName], price, imgPath, [description], [status], Categories.CateID as CateID, CateName\n"
                    + "FROM dbo.Plants join dbo.Categories on Plants.CateID = Categories.CateID\n"
                    + "WHERE PID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                plant = new Plant(rs.getInt("PID"), rs.getString("PName"), rs.getInt("price"), rs.getString("imgPath"), rs.getString("description"), rs.getInt("status"), rs.getInt("CateID"), rs.getString("CateName"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlantDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return plant;
    }
}
