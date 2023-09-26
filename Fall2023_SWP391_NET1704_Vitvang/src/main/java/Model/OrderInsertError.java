/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class OrderInsertError implements Serializable{
      private String orderIdErr;
      private String customerIdErr;
      private String startDateErr;
      private String endDateErr;
      private String cageIdErr;

        public OrderInsertError() {
        }

        public OrderInsertError(String orderIdErr, String customerIdErr, String startDateErr, String endDateErr, String cageIdErr) {
                this.orderIdErr = orderIdErr;
                this.customerIdErr = customerIdErr;
                this.startDateErr = startDateErr;
                this.endDateErr = endDateErr;
                this.cageIdErr = cageIdErr;
        }

        public String getOrderIdErr() {
                return orderIdErr;
        }

        public String getCustomerIdErr() {
                return customerIdErr;
        }

        public String getStartDateErr() {
                return startDateErr;
        }

        public String getEndDateErr() {
                return endDateErr;
        }

        public String getCageIdErr() {
                return cageIdErr;
        }

        public void setOrderIdErr(String orderIdErr) {
                this.orderIdErr = orderIdErr;
        }

        public void setCustomerIdErr(String customerIdErr) {
                this.customerIdErr = customerIdErr;
        }

        public void setStartDateErr(String startDateErr) {
                this.startDateErr = startDateErr;
        }

        public void setEndDateErr(String endDateErr) {
                this.endDateErr = endDateErr;
        }

        public void setCageIdErr(String cageIdErr) {
                this.cageIdErr = cageIdErr;
        }
      
      
      
}
