/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author anhthuyn
 */
public class DBUtils {

    private static final String SERVERNAME = "localhost";
    private static final String INSTANCENAME = "";
    private static final String PORT = "1433";
    private static final String UID = "sa";
    private static final String PASSWORD = "12345";
    private static final String DATABASENAME = "PlantShop";

    public static Connection getConnection() throws Exception {
        String connectionString = "jdbc:sqlserver://" + SERVERNAME + "\\" + INSTANCENAME + ":" + PORT
                + ";databasename=" + DATABASENAME;
        if (INSTANCENAME == null || INSTANCENAME.trim().isEmpty()) {
            connectionString = "jdbc:sqlserver://" + SERVERNAME + ":" + PORT + ";databasename=" + DATABASENAME;
        }
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(connectionString, UID, PASSWORD);
    }
}
