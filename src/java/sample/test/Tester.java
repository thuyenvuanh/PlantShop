/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import java.util.ArrayList;
import daos.AccountDAO;
import dtos.Account;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class Tester {

    public static void main(String[] args) {
        try {
            //getAccount
            Account a = AccountDAO.getAccount("admin@plantshop.com", "sysadmin");
            if (a != null) {
                if (a.getRole() == 1) {
                    System.out.println("I'm an admin");
                } else {
                    System.out.println("I'm an user");
                }
            } else {
                System.out.println("Login failed");
            }
            
            //getAccounts
            ArrayList<Account> list = AccountDAO.getAccounts();
            for (Account account : list) {
                System.out.println(account.toString());
            }
            
            //updateAccountStatus
            System.out.println(AccountDAO.updateAccountStatus("user@gmail.com", 1));
            
            //updateAccount
            boolean result = AccountDAO.updateAccount("thuyenvase161502@fpt.edu.vn", "12345", "Vu Anh Thuyen (K16-HCM)", "0123456789");
            System.out.println(result ? "Success" : "Failed");
            
            //insertAccount
            result = AccountDAO.insertAccount("abc@abc.com", "12345", "abc", "0123456", 1, 0);
            System.out.println(result ? "Added" : "Failed");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}