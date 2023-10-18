/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.order;

/**
 *
 * @author Admin
 */
public class OrderUpdateError {

      private String StartDateAfterEndDateErr;
      private String AddressNullErr;
      private String StatusProgessNullErr;
      private String CustomerFormatErr;
      private String AccountCanNotUpdateErr;
      private String CustomerNotExistInDatabasErr;

      public OrderUpdateError() {
      }

      public OrderUpdateError(String StartDateAfterEndDateErr, String AddressNullErr, String StatusProgessNullErr, String CustomerFormatErr, String AccountCanNotUpdateErr, String CustomerNotExistInDatabasErr) {
            this.StartDateAfterEndDateErr = StartDateAfterEndDateErr;
            this.AddressNullErr = AddressNullErr;
            this.StatusProgessNullErr = StatusProgessNullErr;
            this.CustomerFormatErr = CustomerFormatErr;
            this.AccountCanNotUpdateErr = AccountCanNotUpdateErr;
            this.CustomerNotExistInDatabasErr = CustomerNotExistInDatabasErr;
      }
 

      public String getStartDateAfterEndDateErr() {
            return StartDateAfterEndDateErr;
      }

      public void setStartDateAfterEndDateErr(String StartDateAfterEndDateErr) {
            this.StartDateAfterEndDateErr = StartDateAfterEndDateErr;
      }

      public String getAddressNullErr() {
            return AddressNullErr;
      }

      public void setAddressNullErr(String AddressNullErr) {
            this.AddressNullErr = AddressNullErr;
      }

      public String getStatusProgessNullErr() {
            return StatusProgessNullErr;
      }

      public void setStatusProgessNullErr(String StatusProgessNullErr) {
            this.StatusProgessNullErr = StatusProgessNullErr;
      }

      public String getCustomerFormatErr() {
            return CustomerFormatErr;
      }

      public void setCustomerFormatErr(String CustomerFormatErr) {
            this.CustomerFormatErr = CustomerFormatErr;
      }

      public String getAccountCanNotUpdateErr() {
            return AccountCanNotUpdateErr;
      }

      public void setAccountCanNotUpdateErr(String AccountCanNotUpdateErr) {
            this.AccountCanNotUpdateErr = AccountCanNotUpdateErr;
      }

      public String getCustomerNotExistInDatabasErr() {
            return CustomerNotExistInDatabasErr;
      }

      public void setCustomerNotExistInDatabasErr(String CustomerNotExistInDatabasErr) {
            this.CustomerNotExistInDatabasErr = CustomerNotExistInDatabasErr;
      }
      

}
