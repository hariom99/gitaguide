<%@page import="java.lang.Integer"%>
<%@page import="dao.User" %>

<jsp:useBean id="obj" class="dto.AddCart" ></jsp:useBean>
<jsp:setProperty name="obj" property="*" ></jsp:setProperty>
<%
    User user = new User();
    int id = (Integer)session.getAttribute("id");
    obj.setUserId(id);
    int i= user.addToCart(obj);
    
      if(i==1)
    {
%>

<jsp:include page="userhome.jsp" ></jsp:include>
    
    
    
<%--
<%
    response.sendRedirect("userhome.jsp");
%>
--%>


<%}else{%>
<script>alert("Already Added To Cart ..!!!");</script>
<jsp:include page="userhome.jsp"></jsp:include>
<%}%>
