/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Order;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class OrderInsertError implements Serializable{
      private String orderIdFormatErr;
      private String customerIdFormatErr;
      private String AddressLengthErr;
      private String endDateErr;
      private String cageIdFormatErr;
      private String CustomerNotExistInDatabasErr;
      private String DuplicateOrderIDErr;

      public String getDuplicateOrderIDErr() {
            return DuplicateOrderIDErr;
      }

      public void setDuplicateOrderIDErr(String DuplicateOrderIDErr) {
            this.DuplicateOrderIDErr = DuplicateOrderIDErr;
      }
      
      
        public OrderInsertError() {
        }


      public String getOrderIdFormatErr() {
            return orderIdFormatErr;
      }

      public void setOrderIdFormatErr(String orderIdFormatErr) {
            this.orderIdFormatErr = orderIdFormatErr;
      }

      public String getCustomerIdFormatErr() {
            return customerIdFormatErr;
      }

      public void setCustomerIdFormatErr(String customerIdFormatErr) {
            this.customerIdFormatErr = customerIdFormatErr;
      }

      public String getAddressLengthErr() {
            return AddressLengthErr;
      }

      public void setAddressLengthErr(String AddressLengthErr) {
            this.AddressLengthErr = AddressLengthErr;
      }


      public String getEndDateErr() {
            return endDateErr;
      }

      public void setEndDateErr(String endDateErr) {
            this.endDateErr = endDateErr;
      }

      public String getCageIdFormatErr() {
            return cageIdFormatErr;
      }

      public void setCageIdFormatErr(String cageIdFormatErr) {
            this.cageIdFormatErr = cageIdFormatErr;
      }

      public String getCustomerNotExistInDatabasErr() {
            return CustomerNotExistInDatabasErr;
      }

      public void setCustomerNotExistInDatabasErr(String CustomerNotExistInDatabasErr) {
            this.CustomerNotExistInDatabasErr = CustomerNotExistInDatabasErr;
      }
      
      
      
}
