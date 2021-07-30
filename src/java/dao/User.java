package dao;

import dto.AddCart;
import dto.Login;
import dto.Orders;
import dto.Registration;
import dto.RemoveItemCart;
import dto.SaveTransaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import myConn.GetConnection;

public class User {

 public int registerUser(Registration user) {
  int i = 0;

  Connection con = GetConnection.getConnect();
  String query = "insert into registration(email,password,age,profession,address,city,state,zip,name,mobile) values(?,?,?,?,?,?,?,?,?,?)";
  try {
   PreparedStatement ps = con.prepareStatement(query);

   ps.setString(1, user.getEmail());
   ps.setString(2, user.getPassword());
   ps.setInt(3, user.getAge());
   ps.setString(4, user.getProfession());
   ps.setString(5, user.getAddress());
   ps.setString(6, user.getCity());
   ps.setString(7, user.getState());
   ps.setString(8, user.getZip());
   ps.setString(9, user.getFullName());
   ps.setString(10, user.getMobile());

   i = ps.executeUpdate();
   con.close();

  } catch (SQLException e) {
   i = 2;
   System.out.println("exception in user registration " + e);
  }
  return i;
 }

 public int login(Login login, AddCart ac) {
  int i = 0;
  Connection con = GetConnection.getConnect();
  String query = "select userid,name,email,password from registration where email=? and password=?";

  try {
   PreparedStatement ps = con.prepareStatement(query);
   ps.setString(1, login.getEmail());
   ps.setString(2, login.getPassword());

   ResultSet rs = ps.executeQuery();

   if (rs.next()) {
    i = 1;
    login.setName(rs.getString(2));
    ac.setUserId(rs.getInt("userid"));
   }
   con.close();

  } catch (SQLException e) {
   System.out.println("exception while login user" + e);
  }
  return i;
 }

 public int addToCart(AddCart ac) {

  int i = 0;
  Connection con = GetConnection.getConnect();
  String query = "insert into cart(userid, bookname, bookdetails,price) values(?,?,?,?)";

  String str = ac.getBookDetails();
  String[] arrOfStr = str.split("-", 3);
  arrOfStr[0] += "" + ac.getUserId() + "";
  try {
   PreparedStatement ps = con.prepareStatement(query);
   ps.setInt(1, ac.getUserId());
   ps.setString(2, arrOfStr[0]);
   ps.setString(3, arrOfStr[1]);
   ps.setString(4, arrOfStr[2]);
   i = ps.executeUpdate();
   con.close();
  } catch (SQLException e) {
   System.out.println("Error While Adding in cart !!" + e);
  }

  return i;
 }

 public List<AddCart> getCartItem(int i) {
  Connection con = GetConnection.getConnect();
  String query = "select * from cart where userid=?";
  List<AddCart> list = new ArrayList<>();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   ps.setInt(1, i);
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
    AddCart addCart = new AddCart();

    addCart.setUserId(rs.getInt(1));
    addCart.setBookName(rs.getString(2));
    addCart.setBookDetails(rs.getString(3));
    addCart.setBookPrice(rs.getString(4));

    String str = addCart.getBookName();
    String[] arrOfStr = str.split("_", 2);
    addCart.setBookName(arrOfStr[0]);

    list.add(addCart);

   }
  } catch (SQLException e) {
   System.out.println("error while getting item from cart " + e);
  }
  return list;
 }

 public int removeItem(RemoveItemCart rc) {
  int temp = 0;
  String bName = rc.getBookName();
  String bLang = rc.getBookLang();

  if (bLang.equals("Hindi")) {
   temp = 1;
   bName += "_" + temp + "" + rc.getId();
  }
  if (bLang.equals("English")) {
   temp = 2;
   bName += "_" + temp + "" + rc.getId();
  }
  if (bLang.equals("Marathi")) {
   temp = 3;
   bName += "_" + temp + "" + rc.getId();
  }
  if (bLang.equals("Gujrati")) {
   temp = 4;
   bName += "_" + temp + "" + rc.getId();
  }
  if (bLang.equals("Bangla")) {
   temp = 5;
   bName += "_" + temp + "" + rc.getId();
  }

  System.out.println("the final book name is  " + bName);

  int i = 0;
  Connection con = GetConnection.getConnect();
  String query = "delete from cart where userid=? and bookname=?";
  try {
   PreparedStatement ps = con.prepareStatement(query);
   ps.setInt(1, rc.getId());
   ps.setString(2, bName);
   i = ps.executeUpdate();
  } catch (SQLException e) {
   System.out.println("error while deleteting  item from cart  " + e);
  }
  return i;
 }

 
 
  
 
 
 
 
 public int setTransaction(SaveTransaction st) {
  int i = 0;

  Connection con = GetConnection.getConnect();
  String query = "INSERT INTO transaction (userid, name, amount, payid, orderid) VALUES(?,?,?,?,?)";

  try {
   PreparedStatement ps = con.prepareCall(query);
   ps.setInt(1, st.getUserId());
   ps.setString(2, st.getName());
   ps.setString(3, st.getAmount());
   ps.setString(4, st.getPaymentId());
   ps.setString(5, st.getOrderId());
  
  

   // adding transaction details to database 
   i = ps.executeUpdate();
   System.out.println("data successfullt inserted innto transaction table");

   String quantity = st.getQuantity();
   System.out.println(st.getQuantity());
   int index = 0;
   Connection con2 = GetConnection.getConnect();
   String query2 = "select * from cart where userid=?";

   PreparedStatement ps2 = con2.prepareStatement(query2);
   ps2.setInt(1, st.getUserId());// have to change

   ResultSet rs1 = ps2.executeQuery();
   System.out.println("getting data from cart");
   while (rs1.next()) {
    AddCart addCart = new AddCart();

    addCart.setUserId(rs1.getInt(1));
    addCart.setBookName(rs1.getString(2));
    addCart.setBookDetails(rs1.getString(3));
    addCart.setBookPrice(rs1.getString(4));

    String str = addCart.getBookName();
    String[] arrOfStr = str.split("_", 2);
    addCart.setBookName(arrOfStr[0]);

    Connection con3 = GetConnection.getConnect();
    System.out.println("inserting data into orders");
    String query3 = "insert into orders(userid,quantity,bookname,bookprice,booklang) values(?,?,?,?,?)";
    
    PreparedStatement ps3 = con3.prepareStatement(query3);
    ps3.setInt(1, st.getUserId());// have to change
    
    String c = quantity.charAt(index) + "";
    //String[] qt = c.split(",", 10);

    ps3.setString(2, c);
    
    
    ps3.setString(3, addCart.getBookName());
    ps3.setString(4, addCart.getBookPrice());
    ps3.setString(5, addCart.getBookDetails());
    index++;
    index++;
    i = ps3.executeUpdate();
    System.out.println("data inserted into orders");

   }

   //System.out.println("array lenthhhh    " + st.getQuantity());
   // System.out.println("if statement executed i  " + i);
   i = 0;
   Connection con1 = GetConnection.getConnect();
   String query1 = "delete from cart where userid=?";

   PreparedStatement ps1 = con1.prepareStatement(query1);
   ps1.setInt(1, st.getUserId());
   System.out.println("userid is"+st.getUserId());

   i = ps1.executeUpdate();
   System.out.println("deleting data from cart table");
   System.out.println("after update value of i  " + i);

  } catch (SQLException e) {
   System.out.println("exception while adding details in transcation or maybe in deleting item from cart " + e);
  }

  return i;
 }
 
 
 
 
 
 
 
 
 

 public List<Orders> orderDetails(int i) {
  Connection con = GetConnection.getConnect();
  String query = "select * from orders where userid=?";
  List<Orders> list = new ArrayList<>();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   ps.setInt(1, i);
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
    Orders order = new Orders();

 
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
   System.out.println("error while getting item from my Orders " + e);
  }
  
  return list;

 }
 public int addShippingDetails(Orders ob)
 {
  int i=0;
  Connection con = GetConnection.getConnect();
  String query="update orders set name=?, mobile=?,address=?,zip=? where userid=?";
  try
  {
   PreparedStatement ps = con.prepareStatement(query);
   ps.setString(1,ob.getName());
   ps.setString(2,ob.getMobile());
   ps.setString(3,ob.getAddress());
   ps.setString(4,ob.getZip());
   ps.setInt(5, ob.getUserid());
   i = ps.executeUpdate();
   System.out.println("value of i in update order ship details "+i);
  }
  catch(SQLException e)
  {
   System.out.println("exception while updatig user order details "+e);
  }
  return i;
 }
 
 
 
 
 
 
 public Orders orderShip(int i) {
  Connection con = GetConnection.getConnect();
  String query = "select * from orders where userid=?";
  Orders order = new Orders();
  try {

   PreparedStatement ps = con.prepareStatement(query);
   ps.setInt(1, i);
   ResultSet rs = ps.executeQuery();
  
  
   if(rs.next()) {
    
 System.out.println("orders delivery address  "+rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8)+" "+rs.getString(9));
      
    //order.setName(rs.getString(2));   
    //order.setName(rs.getString(3));   
    //order.setName(rs.getString(4));   
    //order.setName(rs.getString(5));   
    order.setName(rs.getString(6));   
    order.setMobile(rs.getString(7));   
    order.setAddress(rs.getString(8));   
    order.setZip(rs.getString(9));   
    //order.setZip(rs.getString(10));   
    
    

    
    
   }
  } catch (SQLException e) {
   System.out.println("error while getting item from my Orders " + e);
  }
  
  return order;

 }
 

}
