<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
 <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

  <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


  <style>
   .vl {
    border-left: 6px solid green;
    height: 500px;
   }
   .cart{
    border-left: 2px solid #2f2f46;
    padding:0 60px;
   }
   .bl{
    border-right:2px solid #2f2f46 ;
   }
   #box{
    margin-left:9em;
   }
   body {
    font-family: Arial;
    font-size: 17px;
    padding: 8px;
    overflow-x:hidden;
   }
   .container{
    margin-top:1em;
   }
   .header-section-top {
    background-color: #2f2f46;
    color: #FFF;
    padding: 10px 0;
    font-size: 17px;
    font-weight: 900;
    margin-left: -1em;
    margin-right:-1em;
    text-align: center;
   }
   * {
    box-sizing: border-box;
   }
   .row {
    display: -ms-flexbox; /* IE10 */
    display: flex;
    -ms-flex-wrap: wrap; /* IE10 */
    flex-wrap: wrap;
    margin: 0 -16px;
   }
   .col-25 {
    -ms-flex: 25%; /* IE10 */
    flex: 25%;
   }
   .col-50 {
    -ms-flex: 50%; /* IE10 */
    flex: 50%;
   }
   .col-75 {
    -ms-flex: 75%; /* IE10 */
    flex: 75%;
   }
   .col-25,
   .col-50,
   .col-75 {
    padding: 0 60px;
   }
   .container {
    background-color: #f2f2f2;
    padding: 5px 20px 15px 20px;
    border: 1px solid lightgrey;
    border-radius: 3px;
   }
   input[type=text] {
    width: 100%;
    margin-bottom: 20px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 3px;
   }
   label {
    margin-bottom: 10px;
    display: block;
   }
   .icon-container {
    margin-bottom: 20px;
    padding: 7px 0;
    font-size: 24px;
   }
   .btn {
    padding: 5px;
    margin: 10px 0;
    
    border-radius: 3px;
    cursor: pointer;
    font-size: 17px;
   }
   .btn:hover {
    background-color: #45a049;
   }
   a {
    color: #2196F3;
   }
   hr {
    border: 1px solid lightgrey;
   }
   span.price {
    float: right;
    color: grey;
   }
   /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
   @media (max-width: 800px) {
    .row {
     flex-direction: column-reverse;
    }
    .col-25 {
     margin-bottom: 20px;
    }
   }
   #searchbox{
    margin-left:-14rem;
   }
   #searchbtn{
    width:5rem;
   }
   #submitbtn{
    color: white;
    background-color: green;
   }
  </style>

 </head>
 <body>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  <div class="row">
   <div class="col-75">
    <div class="container">

     <!-- form start here..... -->
     <form action="razorPayPayment.jsp" method="post">
      
      


      <%@page import="dto.AddCart" %>
      <%@page import="dao.User" %>
      <%@page import="java.util.*" %>


      <div class="col-50 cart" >
       <h4 style="font-size: 1.17em;font-weight: bold;">Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> </span></h4>
       <div class="items" style="margin-top: 3em;">
        <table id="tbl"  class="table">
         <thead>
          <tr>
           <th scope="col">Product</th>
           <th scope="col">Quantity</th>
           <th scope="col">Price</th>
          </tr>
         </thead>
         <tbody>
           <%
            String name =null;
            
            
            HttpSession s  =  (HttpSession)request.getSession().getServletContext().getAttribute("session");
           
            if(s==null)
            {
             System.out.println("cartcopy if executed");
             
             response.sendRedirect("index.jsp");
             
            System.out.println("if executed after include");
            }
else{
             int j = 1;
            //  name = (String)s.getAttribute("name");
            int i = (Integer) s.getAttribute("id");
            
            User user = new User();
            List<AddCart> list = user.getCartItem(i);
            
            session.setAttribute("books", list);
            for (AddCart ac : list) {


           %>
          <tr>
           
         <div  style=" font: 1px; display: inline-block; margin-top: 0px; "  hidden    id="realPrice<%=j%>" ><%= ac.getBookPrice()%></div>
         <td scope="row" id="bookDetails<%=j%>" ><%=ac.getBookName()+" "%><br><%=" "%>( <%= ac.getBookDetails()%>)</td>
         <td>
          <select  id="qu<%=j%>" onchange="calculate()">
           <option  value="0">0</option>
           <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           <option value="4">4</option>
           <option value="5">5</option>
           <option value="6">6</option>
           <option value="7">7</option>
           <option value="8">8</option>
           <option value="9">9</option>
           <option value="10">10</option>
          </select>
         </td>
         <td id="price<%=j%>"  ><%= ac.getBookPrice()%></td>

         <input  hidden id="oid" name="ORDER_ID" placeholder="order id" value="" >
         <input  hidden id="custid" name="CUST_ID" placeholder="customer id" value="" >
         <td><input hidden id="CHANNEL_ID" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
          <input hidden id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
         <td>
          
          <input  id="bn<%=j%>" hidden  value="<%=ac.getBookName()%>">
          <input  id="id<%=j%>"  hidden value="<%=i%>">
          <input  id="bl<%=j%>"  hidden value="<%=ac.getBookDetails()%>">

           <a href="#" onclick="remove(this.id)" id="<%=j%>" >Remove</a>
          
         </td>
         </tr>
         <br>
         <% j++;
                }%>
         </tbody>
         <thead>
          <tr>
           <th scope="col">Total</th>
           <th scope="col">
           <th  id="totalam" scope="col"> <input id="totalinp" readonly="" name="TXN_AMOUNT" style="width:60px;"> </th> 
          </tr>
         </thead>
        </table>
       </div>
      </div>
    </div>
    <input type="submit" onclick="senddata();" value="Continue to checkout" id="submitbtn" class="btn">
    </form>
   </div>
  </div>
 </div>
 <script>
  function calculate()

  {

   var arr = [];    
  
   var saveQuantity = [];
   var rowlen = document.getElementById("tbl").rows.length;
   for (var r = 1; r <= rowlen - 2; r++) {

    var gopu = document.getElementById("realPrice" + r).innerHTML; // real price from database
    var g = parseInt(gopu);
    var b = document.getElementById("qu" + r).value; // quantity from dropdown
    var b1 = parseInt(b);
    saveQuantity.push(b);
    
    
    
    document.getElementById("price" + r).innerHTML = b1 * g; // changing price according to quantity
    arr.push(b1 * g);
   
   }
   //for payment page
   var price=[];
   var sum1 = 0;
   var bookdetails=[];
   var i = 1;
   for (var item = 0; item < arr.length; item++) {

    sum1 = sum1 + arr[item];
    
    
    var bprice = document.getElementById("price"+i).innerHTML;
    var bd = document.getElementById("bookDetails"+i).innerHTML;
    i++;
    price.push(bprice);
   bookdetails.push(bd);
   }
   sessionStorage.setItem("price",price);
   sessionStorage.setItem('book', bookdetails);
   sessionStorage.setItem('quantity', saveQuantity);
   //alert(saveQuantity);
   var amount = sum1;
   sessionStorage.setItem("amount",amount);
   document.getElementById("totalinp").value = sum1;

  }
 </script>


 <form action="remove-item.jsp"  id="myform" method="post">
  <input type="hidden" id="rembn" name="bookName" value="">
  <input type="hidden" id="remid" name="id" value="">
  <input type="hidden" id="rembl" name="bookLang" value="">


 </form>


 <script>



  function remove(removeId)
  {
   var bv = "bn" + removeId;
   var bn = document.getElementById(bv).value;


   var bl = "bl" + removeId;
   var bln = document.getElementById(bl).value;

   document.getElementById("rembn").value = bn;
   document.getElementById("remid").value =<%=i%>;
   document.getElementById("rembl").value = bln;

   document.getElementById("myform").submit();



  }
 </script>

 <script>



  function senddata()
  {
   var arr = [];
   var rowlen = document.getElementById("tbl").rows.length;
   for (var r = 1; r <= rowlen - 2; r++)
   {
    var b = document.getElementById("qu" + r).value;
   }

  <%int k = 21;%>

   var oid = '<%=i%>-' + Math.random().toString(36).substr(2, 9);


   document.getElementById("oid").value = oid;

   var noid = document.getElementById("oid").value;
   var custid = '<%=i%>' + oid;
   document.getElementById("custid").value = custid;
   var c = document.getElementById("custid").value;



  }
  <%}%>

 </script>


</body>

</html>