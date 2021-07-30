<%@page import="dao.User" %>
<jsp:useBean id="ob" class="dto.Orders" ></jsp:useBean>
<jsp:setProperty name="ob" property="userid" ></jsp:setProperty>
<jsp:setProperty name="ob" property="name" ></jsp:setProperty>
<jsp:setProperty name="ob" property="mobile" ></jsp:setProperty>
<jsp:setProperty name="ob" property="address" ></jsp:setProperty>
<jsp:setProperty name="ob" property="zip" ></jsp:setProperty>
<%
 User userOrder = new User();
 int i = userOrder.addShippingDetails(ob);

 
%>
<script>

<%
 response.sendRedirect("myorders.jsp");

%>
</script>
