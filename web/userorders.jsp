<%-- 
    Document   : userorders
    Created on : Dec 13, 2020, 4:11:29 PM
    Author     : hp
--%>

<%@page import="dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>View Orders Page</title>
 </head>
 <body>
  
  
  <h1>All Orders</h1>
  <br>
  <br>
  <a href="transaction.jsp" >Go To Trasaction Page</a>
  <br>
  <table class="table table-bordered">
   <thead class="thead-dark">
    <tr>
     <th scope="col">S.No</th>

     <th scope="col">Order Id</th>
     <th scope="col">Quantity</th>
     <th scope="col">Book Name</th>
     <th scope="col">Language</th>
     <th scope="col">Book Price</th>


    </tr>
   </thead>
   <%
  
  
  
   AdminDao ad = new AdminDao();
   int j=0;
   List<Orders> list = ad.orderDetails();
   for (Orders o : list) {
  %>
   <tbody>

    <tr>
     <td><%=j%></td>
     <td><%= o.getOrderid()%></td>
     <td><%= o.getQuantity()%></td>
     <td><%= o.getBootName()%></td>
     <td><%= o.getBookLang()%></td>
     <td><%= o.getBookPrice()%></td>

     <td></td>

    </tr>
    <%j++;
     } %>

   </tbody>
  </table>
 </body>
</html>
