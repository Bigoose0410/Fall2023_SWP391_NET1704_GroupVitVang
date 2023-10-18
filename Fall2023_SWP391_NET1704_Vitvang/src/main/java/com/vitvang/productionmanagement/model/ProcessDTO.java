/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ProcessDTO {

      private String UserID;
      private String OrderID;
      private String CageID;
      private String ProcessID;
      private String ProcessName;
      private String Status;
      private Date StartDate;
      private Date EndDate;
      private int NumberOfEmployee;
      private String StatusProgress;
      private int Quantity;
      private String OrderDetailStatus;

      public ProcessDTO() {
      }

      public ProcessDTO(String UserID, String OrderID, String CageID, String ProcessID, String ProcessName, String Status, Date StartDate, Date EndDate, int NumberOfEmployee, String StatusProgress, int Quantity, String OrderDetailStatus) {
            this.UserID = UserID;
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.ProcessID = ProcessID;
            this.ProcessName = ProcessName;
            this.Status = Status;
            this.StartDate = StartDate;
            this.EndDate = EndDate;
            this.NumberOfEmployee = NumberOfEmployee;
            this.StatusProgress = StatusProgress;
            this.Quantity = Quantity;
            this.OrderDetailStatus = OrderDetailStatus;
      }

      public String getUserID() {
            return UserID;
      }

      public void setUserID(String UserID) {
            this.UserID = UserID;
      }

      public String getOrderID() {
            return OrderID;
      }

      public void setOrderID(String OrderID) {
            this.OrderID = OrderID;
      }

      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public String getProcessID() {
            return ProcessID;
      }

      public void setProcessID(String ProcessID) {
            this.ProcessID = ProcessID;
      }

      public String getProcessName() {
            return ProcessName;
      }

      public void setProcessName(String ProcessName) {
            this.ProcessName = ProcessName;
      }

      public String getStatus() {
            return Status;
      }

      public void setStatus(String Status) {
            this.Status = Status;
      }

      public Date getStartDate() {
            return StartDate;
      }

      public void setStartDate(Date StartDate) {
            this.StartDate = StartDate;
      }

      public Date getEndDate() {
            return EndDate;
      }

      public void setEndDate(Date EndDate) {
            this.EndDate = EndDate;
      }

      public int getNumberOfEmployee() {
            return NumberOfEmployee;
      }

      public void setNumberOfEmployee(int NumberOfEmployee) {
            this.NumberOfEmployee = NumberOfEmployee;
      }

      public String getStatusProgress() {
            return StatusProgress;
      }

      public void setStatusProgress(String StatusProgress) {
            this.StatusProgress = StatusProgress;
      }

      public int getQuantity() {
            return Quantity;
      }

      public void setQuantity(int Quantity) {
            this.Quantity = Quantity;
      }

      public String getOrderDetailStatus() {
            return OrderDetailStatus;
      }

      public void setOrderDetailStatus(String OrderDetailStatus) {
            this.OrderDetailStatus = OrderDetailStatus;
      }

}
