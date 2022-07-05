/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import dtos.Order;
import dtos.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import utils.DBUtils;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        Connection connection = null;
        ArrayList<Order> result = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, Orders.[status], orders.AccID, email\n"
                        + "FROM Orders join Accounts on orders.AccID = accounts.accID\n"
                        + "WHERE email = ?";
                ps = connection.prepareStatement(sql);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result.add(new Order(
                            rs.getInt("OrderID"),
                            (rs.getDate("OrdDate") == null) ? null : rs.getDate("OrdDate").toString(),
                            (rs.getDate("shipdate") == null) ? null : rs.getDate("shipdate").toString(),
                            rs.getInt("status"),
                            rs.getInt("AccID"))
                    );
                }
            }
        } catch (Exception e) {
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return result;
    }

    public static ArrayList<OrderDetail> getOrderDetails(int orderID) {
        Connection connection = null;
        ArrayList<OrderDetail> result = new ArrayList();
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                String sql = "SELECT DetailId, OrderID, PID, PName, price, imgPath, quantity\n"
                        + "FROM OrderDetails JOIN Plants on OrderDetails.FID = Plants.PID\n"
                        + "WHERE OrderID = ?";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, orderID);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    result.add(new OrderDetail(
                            rs.getInt("DetailId"),
                            rs.getInt("OrderID"),
                            rs.getInt("PID"),
                            rs.getString("PName"),
                            rs.getInt("price"),
                            rs.getString("imgPath"),
                            rs.getInt("quantity"))
                    );
                }
            }
        } catch (Exception e) {
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return result;
    }

    public static boolean insertOrder(Order order) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                String sql = "INSERT INTO Orders (OrdDate, shipdate, [status], AccID)\n"
                        + "VALUES (?,?,?,?)";
                ps = connection.prepareStatement(sql);
                Date od = new SimpleDateFormat("yyyy-MM-dd").parse(order.getOrderDate());
                Date sd = null;
                if (order.getShipDate() != null) {
                    sd = new SimpleDateFormat("yyyy-MM-dd").parse(order.getShipDate());
                }
                ps.setDate(1, new java.sql.Date(od.getTime()));
                ps.setDate(2, (sd != null) ? new java.sql.Date(sd.getTime()) : null);
                ps.setInt(3, order.getStatus());
                ps.setInt(4, order.getAccID());
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    public static boolean insertOrderDetail(OrderDetail orderDetail) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                String sql = "INSERT INTO OrderDetails (OrderID, FID, quantity)\n"
                        + "VALUES (?,?,?)";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, orderDetail.getOrderID());
                ps.setInt(2, orderDetail.getPlantID());
                ps.setInt(3, orderDetail.getQuantity());
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    public static int count() {
        Connection connection = null;
        ArrayList<OrderDetail> result = new ArrayList();
        PreparedStatement ps = null;
        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                String sql = "SELECT top(1) OrderID \n"
                        + "FROM Orders\n"
                        + "ORDER BY OrderID DESC";
                ResultSet rs = connection.createStatement().executeQuery(sql);
                if (rs.next()) {
                    return rs.getInt("OrderID");
                }
            }
        } catch (Exception e) {
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return -1;
    }
}
