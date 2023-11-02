/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.cage;

/**
 *
 * @author Admin
 */
public class CageInsertError {
      private String IDFormatErr;
      private String IDExistErr;
      private String NameLengthErr;
      private String PriceErr;
      private String OriginLengthErr;
      private String DescriptionengthErr;

      public CageInsertError() {
      }

      public String getIDExistErr() {
            return IDExistErr;
      }

      public void setIDExistErr(String IDExistErr) {
            this.IDExistErr = IDExistErr;
      }

      
      public String getIDFormatErr() {
            return IDFormatErr;
      }

      public void setIDFormatErr(String IDFormatErr) {
            this.IDFormatErr = IDFormatErr;
      }

      public String getNameLengthErr() {
            return NameLengthErr;
      }

      public void setNameLengthErr(String NameLengthErr) {
            this.NameLengthErr = NameLengthErr;
      }

      public String getPriceErr() {
            return PriceErr;
      }

      public void setPriceErr(String PriceErr) {
            this.PriceErr = PriceErr;
      }

      public String getOriginLengthErr() {
            return OriginLengthErr;
      }

      public void setOriginLengthErr(String OriginLengthErr) {
            this.OriginLengthErr = OriginLengthErr;
      }

      public String getDescriptionengthErr() {
            return DescriptionengthErr;
      }

      public void setDescriptionengthErr(String DescriptionengthErr) {
            this.DescriptionengthErr = DescriptionengthErr;
      }
      
}
