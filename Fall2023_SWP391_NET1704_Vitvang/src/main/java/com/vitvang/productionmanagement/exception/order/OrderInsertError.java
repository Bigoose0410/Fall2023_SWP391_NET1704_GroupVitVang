/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.order;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class OrderInsertError implements Serializable {

      private String orderIdFormatErr;
      private String AddressLengthErr;
      private String NullQuantityErr;
      private String QuantityValidErr;
      private String AddressNumberErr;
      private String AddressFormErr;
      private String EmptyCartErr;

      public OrderInsertError() {
      }

      public String getEmptyCartErr() {
            return EmptyCartErr;
      }

      public void setEmptyCartErr(String EmptyCartErr) {
            this.EmptyCartErr = EmptyCartErr;
      }

      public String getOrderIdFormatErr() {
            return orderIdFormatErr;
      }

      public void setOrderIdFormatErr(String orderIdFormatErr) {
            this.orderIdFormatErr = orderIdFormatErr;
      }

      public String getAddressLengthErr() {
            return AddressLengthErr;
      }

      public void setAddressLengthErr(String AddressLengthErr) {
            this.AddressLengthErr = AddressLengthErr;
      }

      public String getNullQuantityErr() {
            return NullQuantityErr;
      }

      public void setNullQuantityErr(String NullQuantityErr) {
            this.NullQuantityErr = NullQuantityErr;
      }

      public String getQuantityValidErr() {
            return QuantityValidErr;
      }

      public void setQuantityValidErr(String QuantityValidErr) {
            this.QuantityValidErr = QuantityValidErr;
      }

      public String getAddressNumberErr() {
            return AddressNumberErr;
      }

      public void setAddressNumberErr(String AddressNumberErr) {
            this.AddressNumberErr = AddressNumberErr;
      }

      public String getAddressFormErr() {
            return AddressFormErr;
      }

      public void setAddressFormErr(String AddressFormErr) {
            this.AddressFormErr = AddressFormErr;
      }

}
