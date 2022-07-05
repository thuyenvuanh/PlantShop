/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dtos;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class Order {
    private int orderID;
    private String orderDate, shipDate;
    private int status;
    private int accID;

    public Order(int orderID) {
        this.orderID = orderID;
    }

    public Order(int orderID, String orderDate, String shipDate, int status, int accID) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", orderDate=" + orderDate + ", shipDate=" + shipDate + ", status=" + status + ", accID=" + accID + '}';
    }
    
}
