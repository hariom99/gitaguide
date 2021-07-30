<%@page import="dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="dao.User"%>
<!DOCTYPE html>
<html lang="en">

 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <title>Document</title>
  <style>
   .heading {
    text-align: center;
    font-weight: bold;
    font-size: 2rem;
    margin-bottom: 2rem;
   }

   .form1 {
    margin-top: 5rem;
    margin-left: 2rem;
   }

   body {
    overflow-x: hidden;
   }

   .btn-warning {
    margin-left: 4rem;
    margin-top: 2rem;
   }

   .head {
    font-weight: bold;
    font-size: 2rem;
    margin-bottom: 2rem;
    margin-left: 2rem;
    ;
   }
  </style>
 </head>
 <%@include file="header.jsp" %>
 <br>
 
 <body>
  <%
    int j = 1;
    HttpSession s1 = (HttpSession) request.getSession().getServletContext().getAttribute("session");
    if(s1==null)
    {
    %>
    <jsp:include page="index.jsp" ></jsp:include>
 <%} else{%>
  <div class="heading">
   My Orders
  </div>
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
  
  
   int i = (Integer) s1.getAttribute("id");
   User user = new User();
   List<Orders> list = user.orderDetails(i);
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

    

    </tr>
    <%j++;
     }} %>

   </tbody>
  </table>
  <div class="form1">
   <div class="head">
    Delivering To 
   </div>
   <%
    User add = new User();
    

    HttpSession s = (HttpSession) request.getSession().getServletContext().getAttribute("session");
    if (s == null) {
     
    }
    else{
     
 
   int uid = (Integer)s.getAttribute("id");
   Orders o = add.orderShip(uid);

   %>
   <form action="ordersupdate.jsp" method="post">

    <div class="form-group row col-md-6">

     <input hidden  type="text" class="form-control"  name="userid" value="<%=uid%>" >



     <label for="name" class="col-sm-2 col-form-label">Full name</label>
     <div class="col-sm-10">
      <input required type="text" class="form-control" id="name" value="<%=o.getName()%>"  name="name" >
     </div>
    </div>
    <div class="form-group row col-md-6">
     <label for="mobileno" class="col-sm-2 col-form-label">Mobile</label>
     <div class="col-sm-10">
      <input required type="text" name="mobile" class="form-control" id="mobile" value="<%=o.getMobile()%>">
     </div>
    </div>
    <div class="form-group row col-md-6">
     <label for="address" class="col-sm-2 col-form-label">Address</label>
     <div class="col-sm-10">
      <input required type="text" name="address" class="form-control" id="address" value="<%=o.getAddress()%>" >
     </div>
    </div>
    <div class="form-group row col-md-6">
     <label for="zipcode" class="col-sm-2 col-form-label">Zip code</label>
     <div class="col-sm-10">
      <input required type="text" name="zip" class="form-control" id="zcode" value="<%=o.getZip()%>" >
     </div>
    </div>
    <div class="form-group row">
     <div class="col-sm-10">
      <button type="submit" class="btn btn-warning">Submit</button>
     </div>
    </div>
   </form>
  </div>
     <%}

     %>
 </body>

</html>