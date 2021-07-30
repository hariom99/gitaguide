
 <%@page import="dao.User" %>
 <jsp:useBean id="obj" class="dto.RemoveItemCart" ></jsp:useBean>
 <jsp:setProperty name="obj" property="*" ></jsp:setProperty>
 
 <%
  
  User userRemove = new User();
  
  int ri = userRemove.removeItem(obj);
  if(ri==1)
  {
  
 %>
 <%@include file="cart.jsp" %>
 <%}else{%>
 <%@include file="cart.jsp" %>
 <%}%>
