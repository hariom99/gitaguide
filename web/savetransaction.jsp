<%@page import="dao.User" %>
<jsp:useBean id="obj" class="dto.SaveTransaction"></jsp:useBean>
<jsp:setProperty name="obj" property="*" ></jsp:setProperty>
<%
 User u = new User();
 int res = u.setTransaction(obj);
 if(res==1)
 {
  System.out.println("saved");
 }
%>
<jsp:include page="myorders.jsp"></jsp:include>