<%
 Object o = session.getAttribute("admin");
 System.out.println(o);
 if(o == null)
 {
  %>
  
  <jsp:include page="admin.html"></jsp:include>
<%
 }
%>
<%-- css  --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
 <a class="navbar-brand" href="#">Gita guide</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
 </button>

 <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
   <li class="nav-item active">
    <a class="nav-link" href="adminhome.jsp">Home <span class="sr-only">(current)</span></a>
   </li>
   <li class="nav-item active">
    <a class="nav-link" href="adminViewOrders.jsp">View All Orders <span class="sr-only"></span></a>
   </li>
   
   <li class="nav-item active">
    <a class="nav-link" href="adminViewTransaction.jsp">View All Transactions <span class="sr-only"></span></a>
   </li>
   
   <li class="nav-item active">
    <a class="nav-link" href="adminLogout.jsp">Logout <span class="sr-only">(current)</span></a>
   </li>
   
 </div>
</nav>

<center><h1>Welcome To Admin Panel<h1></center>  
 
   
<%@page import="dto.Orders" %>
<%@page import="dao.AdminDao" %>
<%@page import="java.util.*" %>
   
   
   
   <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">S.No. </th>
      <th scope="col">User Id</th>
      <th scope="col">User Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Book Price</th>
      <th scope="col">Book Language</th>
      <th scope="col">Mobile</th>
      <th scope="col">Address</th>
      <th scope="col">ZIP Code</th>
      
    </tr>
  </thead>
  <tbody>
   <%
    AdminDao ad = new AdminDao();
    List <Orders> list = ad.orderDetails();
    int i=1;
    for(Orders od : list)
    {
     
    
   %>
    <tr>
      <th scope="row"><%=i%></th>
      <td><%=od.getUserid() %></td>
      <td><%=od.getName() %></td>
      <td><%=od.getBootName() %></td>
      <td><%=od.getBookPrice() %></td>
      <td><%=od.getBookLang() %></td>
      <td><%=od.getMobile() %></td>
      <td><%=od.getAddress() %></td>
      <td><%=od.getZip() %></td>
      
    </tr>
    <%
     i++;
     }
    %>
  </tbody>
</table>