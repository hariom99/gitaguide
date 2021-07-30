package dto;

public class SaveTransaction {
// all information will get from razorpay page via form
int useridAdmin;

 int userId;
 String name;
 String amount;
 String paymentId;
 String orderId;
 String quantity;

 public int getUseridAdmin() {
  return useridAdmin;
 }

 public void setUseridAdmin(int useridAdmin) {
  this.useridAdmin = useridAdmin;
 }

 
 public int getUserId() {
  return userId;
 }

 public void setUserId(int userId) {
  this.userId = userId;
 }

 public String getName() {
  return name;
 }

 public void setName(String name) {
  this.name = name;
 }

 public String getAmount() {
  return amount;
 }

 public void setAmount(String amount) {
  this.amount = amount;
 }

 public String getPaymentId() {
  return paymentId;
 }

 public void setPaymentId(String paymentId) {
  this.paymentId = paymentId;
 }

 public String getOrderId() {
  return orderId;
 }

 public void setOrderId(String orderId) {
  this.orderId = orderId;
 }

 public String getQuantity() {
  return quantity;
 }

 public void setQuantity(String quantity) {
  this.quantity = quantity;
 }

 
 
 
 
}
