<%@page import="com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList"%>
<!DOCTYPE html>
<%@page import="dto.SaveTransaction" %>
<%@page import="dao.AdminDao" %>
<%@page import="java.util.*" %>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <title>Document</title>
  <style>
   .heading{
    text-align:center;
    font-weight:bold;
    font-size:2rem;
    margin-bottom:2rem;
   }

  </style>
 </head>
 <body>
  <div class="heading">
   Transaction Details
  </div>
  
  <a href="userorders.jsp" >Go TO Orders</a>
  <br><br><br> 
  <table class="table table-bordered">
   <thead class="thead-dark">
    <tr>
     <th scope="col">S.No</th>
     <th scope="col">MID</th>
     <th scope="col">TXNID</th>
     <th scope="col">ORDERID</th>
     <th scope="col">BANKTXNID</th>
     <th scope="col">TXNAMOUNT</th>
     <th scope="col">CURRENCY</th>
     <th scope="col">STATUS</th>
     <th scope="col">RESPCODE</th>
     <th scope="col">RESPMG</th>
     <th scope="col">TXNDATE</th>
     <th scope="col">GATEWAYN</th>
     <th scope="col">BANKNAME</th>
     <th scope="col">PAYMENT MODE</th>
    </tr>
   </thead>
   <%
    AdminDao ad = new AdminDao();
    int i = 1;
    List<SaveTransaction> list = ad.getTransaction();
    for (SaveTransaction s : list) {

   %>
   <tbody>
    <tr>
     <td><%=i%></td>
     <td><%=s.getMID()%></td>
     <td><%=s.getTxnId()%></td>
     <td><%=s.getOrderId()%></td>
     <td><%=s.getBankTXNID()%></td>
     <td><%=s.getTxnAmount()%></td>
     <td><%=s.getCurrency()%></td>
     <td><%=s.getStatus()%></td>
     <td><%=s.getRESPCODE()%></td>
     <td><%=s.getRespMsg()%></td>
     <td><%=s.getDate()%></td>
     <td><%=s.getGatewayName()%></td>
     <td><%=s.getBankName()%></td>
     <td><%=s.getPaymentMode()%></td>

    </tr>
    <%i++;
          }%>
   </tbody>
 </body>
</html>