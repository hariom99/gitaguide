<%@page import="com.razorpay.Order"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>payment</title>
 </head>
 <body>
  <button id="rzp-button1" style="width: 100px; height: 100px">Pay</button>
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  
  <form action="transactionSave.jsp" id="savedata" >
   <input hidden="" name="userId" value="" id="userid" type="text" >
   <input hidden="" name="name" value="" id="name" type="text" >
   <input hidden="" name="amount" value="" id="amount" type="text" >
   <input hidden="" name="paymentId" value="" id="pid" type="text" >
   <input hidden="" name="orderId" value="" id="orderId" type="text" >
   <input hidden="" name="quantity" value="" id="quantity" type="text" >
   
  </form>
  <script>

   <%

   Object id = session.getAttribute("id");
    Object name = session.getAttribute("name");

   %>
    amt = sessionStorage.getItem("amount");
    var final_amt = Number(amt);
    final_amt = final_amt*100;
   // alert(final_amt);
   var options = {
    "key": "", // Enter the Key ID generated from the Dashboard
    "amount": final_amt, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "<%=name%>",
    "description": "Hare Krishn",
    "image": "12",
    "order_id": "order_G0dfWvHkuL3iQP", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response) {

     //alert("success");
     //alert("paymnt ID");
     //alert(response.razorpay_payment_id);
     //alert("Order ID");
     //alert(response.razorpay_order_id);
     //alert("Signature");
     //alert(response.razorpay_signature);

     var book = sessionStorage.getItem("book");
     var quantity = sessionStorage.getItem("quantity");
     var price = sessionStorage.getItem("price");
     var amount = sessionStorage.getItem("amount");
     var pid = response.razorpay_payment_id;
     document.getElementById("userid").value="<%=id%>";
     document.getElementById("name").value="hariom";
     document.getElementById("amount").value=amount;
     document.getElementById("pid").value=pid;
     document.getElementById("quantity").value=quantity;
     document.getElementById("savedata").submit();
     
     alert(amount);
     
     var b = [];
     b = book.split(",");
    
    

    },
    "prefill": {
     "name": "Gaurav Kumar",
     "email": "gaurav.kumar@example.com",
     "contact": "9999999999"
    },
    "notes": {
     "address": "Razorpay Corporate Office"
    },
    "theme": {
     "color": "#3399cc"
    }
   };
   var rzp1 = new Razorpay(options);
   rzp1.on('payment.failed', function (response) {
    alert("hi");
    alert(response.error.code);
    alert(response.error.description);
    alert(response.error.source);
    alert(response.error.step);
    alert(response.error.reason);
    alert(response.error.metadata.order_id);
    alert(response.error.metadata.payment_id);
   });
   document.getElementById('rzp-button1').onclick = function (e) {
    rzp1.open();
    e.preventDefault();
   };
  </script>
 </body>
</html>
