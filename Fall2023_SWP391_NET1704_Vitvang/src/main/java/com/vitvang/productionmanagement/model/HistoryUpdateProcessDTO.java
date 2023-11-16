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
public class HistoryUpdateProcessDTO {
      private int HistoryID;
      private String ProcessName;
      private String ProcessID;
      private String OrderID;
      private String Phrase;
      private String CageID;
      private Date UpdateDate;
      private String Content;
      private String TypeOfUpdate;
      private String UserIDUpdate;
      private String UserNameUpdate;

      public HistoryUpdateProcessDTO() {
      }

      public HistoryUpdateProcessDTO( String ProcessName, String ProcessID, String OrderID, String CageID, String Content , Date UpdateDate, String TypeOfUpdate) {         
            this.ProcessName = ProcessName;
            this.ProcessID = ProcessID;
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.Content = Content;
            this.UpdateDate = UpdateDate;
            this.TypeOfUpdate = TypeOfUpdate;
      }

      public HistoryUpdateProcessDTO(String ProcessName, String ProcessID, String OrderID, String CageID, String Content, Date UpdateDate ,String TypeOfUpdate, String UserIDUpdate, String UserNameUpdate) {
            this.ProcessName = ProcessName;
            this.ProcessID = ProcessID;
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.Content = Content;
            this.UpdateDate = UpdateDate;
            this.TypeOfUpdate = TypeOfUpdate;
            this.UserIDUpdate = UserIDUpdate;
            this.UserNameUpdate = UserNameUpdate;
      }

      public String getUserIDUpdate() {
            return UserIDUpdate;
      }

      public void setUserIDUpdate(String UserIDUpdate) {
            this.UserIDUpdate = UserIDUpdate;
      }

      public String getUserNameUpdate() {
            return UserNameUpdate;
      }

      public void setUserNameUpdate(String UserNameUpdate) {
            this.UserNameUpdate = UserNameUpdate;
      }
      

      public int getHistoryID() {
            return HistoryID;
      }

      public void setHistoryID(int HistoryID) {
            this.HistoryID = HistoryID;
      }

      public String getProcessName() {
            return ProcessName;
      }

      public void setProcessName(String ProcessName) {
            this.ProcessName = ProcessName;
      }

      public String getProcessID() {
            return ProcessID;
      }

      public void setProcessID(String ProcessID) {
            this.ProcessID = ProcessID;
      }

      public String getOrderID() {
            return OrderID;
      }

      public void setOrderID(String OrderID) {
            this.OrderID = OrderID;
      }

      public String getPhrase() {
            return Phrase;
      }

      public void setPhrase(String Phrase) {
            this.Phrase = Phrase;
      }

      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public Date getUpdateDate() {
            return UpdateDate;
      }

      public void setUpdateDate(Date UpdateDate) {
            this.UpdateDate = UpdateDate;
      }

      public String getContent() {
            return Content;
      }

      public void setContent(String Content) {
            this.Content = Content;
      }

      public String getTypeOfUpdate() {
            return TypeOfUpdate;
      }

      public void setTypeOfUpdate(String TypeOfUpdate) {
            this.TypeOfUpdate = TypeOfUpdate;
      }
      
      
}
