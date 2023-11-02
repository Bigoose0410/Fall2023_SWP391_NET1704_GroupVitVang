/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.processs;

/**
 *
 * @author Admin
 */
public class DesignProcessErr {
      private String DescriptionLengthErr;
      private String EmployeeFormatErr;
      private String CompletionCageErr;
      private String DuplicateIDErr;

      public DesignProcessErr() {
      }
      
      public String getDuplicateIDErr() {
            return DuplicateIDErr;
      }

      public void setDuplicateIDErr(String DuplicateIDErr) {
            this.DuplicateIDErr = DuplicateIDErr;
      }
      


      public String getDescriptionLengthErr() {
            return DescriptionLengthErr;
      }

      public void setDescriptionLengthErr(String DescriptionLengthErr) {
            this.DescriptionLengthErr = DescriptionLengthErr;
      }

      public String getEmployeeFormatErr() {
            return EmployeeFormatErr;
      }

      public void setEmployeeFormatErr(String EmployeeFormatErr) {
            this.EmployeeFormatErr = EmployeeFormatErr;
      }

      public String getCompletionCageErr() {
            return CompletionCageErr;
      }

      public void setCompletionCageErr(String CompletionCageErr) {
            this.CompletionCageErr = CompletionCageErr;
      }
      
      
}
