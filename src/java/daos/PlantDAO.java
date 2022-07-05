/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import dtos.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class PlantDAO {

    public static ArrayList<Plant> searchPlant(String keyword, String searchBy) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();

        Connection connection = DBUtils.getConnection();
        if (connection == null) {
            throw new Exception("Cannot connect to the database");
        }
        if (searchBy == null) {
            throw new Exception("Search by not found");
        }
        String sql = "SELECT PID, [PName], price, imgPath, [description], [status], Categories.CateID as CateID, CateName\n"
                + "FROM dbo.Plants join dbo.Categories on Plants.CateID = Categories.CateID\n"
                + ((searchBy.equalsIgnoreCase("byname")) ? "WHERE [PName] like ?" : "WHERE CateName like ?");
        
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {            
            list.add(new Plant(rs.getInt("PID"), rs.getString("PName"), rs.getInt("price"), rs.getString("imgPath"), rs.getString("description"), rs.getInt("status"), rs.getInt("CateID"), rs.getString("CateName")));
        }
        return list;
    }
}
