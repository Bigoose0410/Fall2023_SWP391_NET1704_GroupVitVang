/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public final class tool {

      public static final String DATE_FORMAT = "MM/dd/yyyy";
      private static final String IGNORE_CASE_PATTERN = "(?i)";
      private static final int PRODUCTS_STEP1__PER_8HOURS = 312;
      private static final int PRODUCTS_STEP2__PER_8HOURS = 520;
      private static final int PRODUCTS_STEP3__PER_8HOURS = 288;
      private static final int PRODUCTS_STEP4__PER_8HOURS = 528;

      private tool() {
      }

      public static boolean compareDate(Date StartDate, Date EndDate) {
            return StartDate.after(EndDate);
      }

      public static boolean checkFormat(String str, String regex, boolean ignoreCase) {
            if (str != null && regex != null) {
                  if (ignoreCase) {
                        regex = IGNORE_CASE_PATTERN + regex;
                  }
                  return str.matches(regex);
            }
            return false;
      }

      public static boolean checkRole(int RoleID, int RoleAccept) {
            if (RoleID == RoleAccept) {
                  return true;
            } else {
                  return false;
            }
      }

      public static Date calculateProcess1Date(
              Date startDate, int quantity) {

            // Tính thời gian cần thiết cho quy trình
            long time = (quantity * 28800L * 24 * 60 * 60) / PRODUCTS_STEP1__PER_8HOURS;

            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            Date processStartDate = startDate;

            // Ngày kết thúc của quy trình
            Date processEndDate = new Date(processStartDate.getTime() + time);

            return processEndDate;
      }
      public static Date calculateProcess2Date(
              Date startDate, int quantity) {

            // Tính thời gian cần thiết cho quy trình
            long time = (quantity * 28800L * 24 * 60 * 60) / PRODUCTS_STEP2__PER_8HOURS;

            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            Date processStartDate = startDate;

            // Ngày kết thúc của quy trình
            Date processEndDate = new Date(processStartDate.getTime() + time);

            return processEndDate;
      }
      public static Date calculateProcess3Date(
              Date startDate, int quantity) {

            // Tính thời gian cần thiết cho quy trình
            long time = (quantity * 28800L * 24 * 60 * 60) / PRODUCTS_STEP3__PER_8HOURS;

            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            Date processStartDate = startDate;

            // Ngày kết thúc của quy trình
            Date processEndDate = new Date(processStartDate.getTime() + time);

            return processEndDate;
      }
      public static Date calculateProcess4Date(
              Date startDate, int quantity) {

            // Tính thời gian cần thiết cho quy trình
            long time = (quantity * 28800L * 24 * 60 * 60) / PRODUCTS_STEP4__PER_8HOURS;

            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            Date processStartDate = startDate;

            // Ngày kết thúc của quy trình
            Date processEndDate = new Date(processStartDate.getTime() + time);

            return processEndDate;
      }
      
}
