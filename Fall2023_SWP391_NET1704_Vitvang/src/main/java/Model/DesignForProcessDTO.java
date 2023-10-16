/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class DesignForProcessDTO {

      private String Phrase;
      private String CageID;
      private int TimeProcess;
      private String Description;
      private int NumberOfEmployee;
      private int NumCompletionCage;
      private int TotalpriceOfProcess;

      public DesignForProcessDTO() {
      }

      public DesignForProcessDTO(String Phrase, String CageID, int TimeProcess, String Description, int NumberOfEmployee, int NumCompletionCage) {
            this.Phrase = Phrase;
            this.CageID = CageID;
            this.TimeProcess = TimeProcess;
            this.Description = Description;
            this.NumberOfEmployee = NumberOfEmployee;
            this.NumCompletionCage = NumCompletionCage;
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

      public int getTimeProcess() {
            return TimeProcess;
      }

      public void setTimeProcess(int TimeProcess) {
            this.TimeProcess = TimeProcess;
      }

      public String getDescription() {
            return Description;
      }

      public void setDescription(String Description) {
            this.Description = Description;
      }

      public int getNumberOfEmployee() {
            return NumberOfEmployee;
      }

      public void setNumberOfEmployee(int NumberOfEmployee) {
            this.NumberOfEmployee = NumberOfEmployee;
      }

      public int getNumCompletionCage() {
            return NumCompletionCage;
      }

      public void setNumCompletionCage(int NumCompletionCage) {
            this.NumCompletionCage = NumCompletionCage;
      }

      public int getTotalpriceOfProcess() {
            int employePrice = 3000;
            return this.getTimeProcess() * this.getNumberOfEmployee() * employePrice;
      }

      public void setTotalpriceOfProcess(int TotalpriceOfProcess) {
            this.TotalpriceOfProcess = TotalpriceOfProcess;
      }

}
