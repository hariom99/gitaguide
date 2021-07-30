package dao;

import dto.AddCart;
import dto.AdminLogin;
import dto.Orders;
import dto.SaveTransaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import myConn.GetConnection;

public class AdminDao {

 // admin login
 public int adminLogin(AdminLogin al) 
 {
  int i=0;
  Connection con = GetConnection.getConnect();
  String query = "select userid,password from admin where userid=? and password=?";
  try
  {
   PreparedStatement ps = con.prepareStatement(query);
   ps.setString(1, al.getUserId());
   ps.setString(2, al.getPassword());
   ResultSet rs = ps.executeQuery();
   if(rs.next())
   {
    i=1;
   }
     con.close();
  }
  catch(SQLException e)
  {
   System.out.println("eror while login in admin panel "+e);
  }

  return i;
 }
 
 
 public List<SaveTransaction> getTransaction() {
  Connection con = GetConnection.getConnect();
  String query = "select * from transaction";
  List<SaveTransaction> list = new ArrayList<>();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
    SaveTransaction st = new SaveTransaction();
                                      System.out.println(rs.getInt(1));
    st.setUserId(rs.getInt(1));
    st.setUseridAdmin(rs.getInt(1));
                                         System.out.println(st.getUserId());
    st.setName(rs.getString(2));
    st.setAmount(rs.getString(3));
    st.setPaymentId(rs.getString(4));
    st.setUserId(rs.getInt(5));

    
    list.add(st);

   }
   con.close();
  } catch (SQLException e) {
   System.out.println("error while getting item from transaction " + e);
  }
  return list;
 }

 public List<Orders> getOrders() {
  Connection con = GetConnection.getConnect();
  String query = "select * from orders";
  List<Orders> list = new ArrayList<>();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
    Orders o = new Orders();

    o.setUserid(rs.getInt(1));
    o.setOrderid(rs.getString(2));
    o.setQuantity(rs.getString(3));
    o.setBootName(rs.getString(4));
    o.setBookLang(rs.getString(5));
    o.setBookPrice(rs.getString(6));

    list.add(o);

   }
   con.close();
  } catch (SQLException e) {
   System.out.println("error while getting item from orders " + e);
  }
  return list;
 }

 public List<Orders> orderDetails() {
  Connection con = GetConnection.getConnect();
  String query = "select * from orders ";
  List<Orders> list = new ArrayList<>();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
    Orders order = new Orders();

    order.setUserid(rs.getInt(1));
    
    order.setQuantity(rs.getString(2));
    
    order.setBootName(rs.getString(3));
    
    order.setBookPrice(rs.getString(4));

    order.setBookLang(rs.getString(5));
    
    order.setName(rs.getString(6));
    
    order.setMobile(rs.getString(7));
    
    order.setAddress(rs.getString(8));
    
    order.setZip(rs.getString(9));
    

    list.add(order);

   }
  } catch (SQLException e) {
   System.out.println("error while getting item from my Orders in admin dao " + e);
  }

  return list;

 }

}
