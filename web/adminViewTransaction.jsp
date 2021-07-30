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

<%@page import="dto.SaveTransaction" %>
<%@page import="dao.AdminDao" %>
<%@page import="java.util.*" %>

<table class="table table-striped">
 <thead>
  <tr>
  <th scope="col">S.No. </th>
  <th scope="col">User ID</th>
  <th scope="col">Name</th>
  <th scope="col">Payment ID</th>
  <th scope="col">Order ID</th>
  <th scope="col">Amount</th>
  </tr>
 </thead>
 <tbody>
  <%
       AdminDao ad = new AdminDao();
       List<SaveTransaction> list = ad.getTransaction();
       int i=1;
    
       for (SaveTransaction st : list) {
  %>
  

  <tr>
  <th scope="row"><%=i%></th>
  <td><%=st.getUseridAdmin()%></td>
                                <%System.out.println("userid in fe "+st.getUserId()) ;%>
  <td><%=st.getName()%></td>
  <td><%=st.getPaymentId()%></td>
  <td><%=st.getOrderId()%></td>
  <td><%=st.getAmount()%></td>
  
  </tr>
<%
 i++;
}
%>
 </tbody>
</table>