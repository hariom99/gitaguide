/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto  ;

import java.io.Serializable;

/**
 *
 * @author hp
 */
public class RemoveItemCart implements Serializable{
 int id = 0;
 String bookName;
 String bookLang;

 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }

 public String getBookName() {
  return bookName;
 }

 public void setBookName(String bookName) {
  this.bookName = bookName;
 }

 public String getBookLang() {
  return bookLang;
 }

 public void setBookLang(String bookLang) {
  this.bookLang = bookLang;
 }

 public RemoveItemCart() {
 }

 
}
