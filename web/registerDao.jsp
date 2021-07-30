<%-- 
    Document   : registerDao
    Created on : Nov 4, 2020, 4:09:53 PM
    Author     : hp
--%>

<%@page import="dao.User" %>
<jsp:useBean id="obj" class="dto.Registration"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>

<%
    User cd = new User();
    int i = cd.registerUser(obj);
    if(i==1)
    {
%>
<script>alert(" Registerd successfully..!!!");</script>
<jsp:include page="index.jsp"></jsp:include>
<%}else if(i==2){%>
<script>alert(" already Registered ..!!!");</script>
<jsp:include page="index.jsp"></jsp:include>


<%}else{%>
<script>alert("Error while Registering..!!!");</script>
<jsp:include page="index.jsp"></jsp:include>
<%}%>