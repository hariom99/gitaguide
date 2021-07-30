<%-- 
    Document   : login
    Created on : Nov 5, 2020, 9:11:02 AM
    Author     : hp
--%>

<%@page import="dao.User" %>
<jsp:useBean id="ob1" class="dto.AddCart" ></jsp:useBean>
<jsp:useBean id="obj" class="dto.Login" ></jsp:useBean>
<jsp:setProperty name="obj" property="*" ></jsp:setProperty>

<%
    User user = new User();
    int i = user.login(obj,ob1);
   session.setAttribute("id", ob1.getUserId());
   session.setAttribute("name", obj.getName());
    request.getSession().getServletContext().setAttribute("session", session);

    
    
    
    if(i==1)
    {
%>
<script> alert("Login Success"); </script>

<%
    response.sendRedirect("userhome.jsp");
%>

<%}else{%>
<script> alert("wrong user id or password !"); </script>
<jsp:include page="index.jsp"></jsp:include>
<%}%>
