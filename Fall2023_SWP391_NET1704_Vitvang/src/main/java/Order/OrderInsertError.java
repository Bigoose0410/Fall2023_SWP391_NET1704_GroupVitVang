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
      private String startDateErr;
      private String endDateErr;
      private String cageIdFormatErr;
      private String CustomerNotExistInDatabasErr;
      
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

      public String getStartDateErr() {
            return startDateErr;
      }

      public void setStartDateErr(String startDateErr) {
            this.startDateErr = startDateErr;
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
