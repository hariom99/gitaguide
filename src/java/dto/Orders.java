
package dto;

public class Orders 
{
 int userid;
 String orderid;
 String quantity;
 String bootName;
 String bookPrice;
 String name;
 String mobile;
 String address;
 String zip;

 public void setName(String name) {
  this.name = name;
 }

 public void setAddress(String address) {
  this.address = address;
 }

 public void setMobile(String mobile) {
  this.mobile = mobile;
 }

 public void setZip(String zip) {
  this.zip = zip;
 }

 public String getAddress() {
  return address;
 }

 public String getMobile() {
  return mobile;
 }

 public String getName() {
  return name;
 }

 public String getZip() {
  return zip;
 }
 

 public int getUserid() {
  return userid;
 }

 public void setUserid(int userid) {
  this.userid = userid;
 }

 public String getOrderid() {
  return orderid;
 }

 public void setOrderid(String orderid) {
  this.orderid = orderid;
 }

 public String getQuantity() {
  return quantity;
 }

 public void setQuantity(String quantity) {
  this.quantity = quantity;
 }

 public String getBootName() {
  return bootName;
 }

 public void setBootName(String bootName) {
  this.bootName = bootName;
 }

 public String getBookPrice() {
  return bookPrice;
 }

 public void setBookPrice(String bookPrice) {
  this.bookPrice = bookPrice;
 }

 public String getBookLang() {
  return bookLang;
 }

 public void setBookLang(String bookLang) {
  this.bookLang = bookLang;
 }
 String bookLang;
}
