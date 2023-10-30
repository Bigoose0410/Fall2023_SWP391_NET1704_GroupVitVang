/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author Admin
 */
public final class tool {

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

      public static String getNextProcessID(String processID) {
            String prefix = processID.substring(0, 2); // Lấy phần tiền tố "PR"
            int number = Integer.parseInt(processID.substring(2)); // Lấy phần số xxx
            int nextNumber = number + 1; // Tăng giá trị số xxx lên 1
            String nextNumberString = String.format("%03d", nextNumber); // Định dạng lại số xxx thành chuỗi có 3 chữ số
            return prefix + nextNumberString; // Tạo chuỗi processID mới bằng cách kết hợp phần tiền tố và phần số
      }

      public static Date calculateProcessDate(Date startDate, int quantity, int timeprocess, int employeeinDesign, int maxConpletionperDay, int empInprocess) {

            double maxConpletion = 1d * empInprocess * (maxConpletionperDay * 1d / employeeinDesign);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c1 = Calendar.getInstance();
            // Tính thời gian cần thiết cho quy trình
            // (số lượng lồng cần sx / số lượng có thể sx trong 1 ngày)
            double time = Math.ceil((quantity / (maxConpletion / timeprocess)) / 8);
            System.out.println(time);
            c1.setTime(startDate);
            c1.roll(Calendar.DATE, (int) time);
            double mountcount = Math.floor(time / 30);
            if (time > 30) {
                  for (int i = 0; i < (int) mountcount; i++) {
                        c1.roll(Calendar.MONTH, 1);
                        if (c1.getTime().getMonth() < startDate.getMonth()) {
                              c1.roll(Calendar.YEAR, 1);
                        }
                  }
            } else {
                  if (c1.getTime().getDate() < startDate.getDate()) {
                        c1.roll(Calendar.MONTH, 1);
                  }
                  if (c1.getTime().getMonth() < startDate.getMonth()) {
                        c1.roll(Calendar.YEAR, 1);
                  }
            }
            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            // Ngày kết thúc của quy trình
            String processEndDate = formatter.format(c1.getTime());
            Date EndDate = Date.valueOf(processEndDate);
            return EndDate;
      }

 public static long getVaildYob(Date birthDate) {
            long millis = System.currentTimeMillis();
            java.sql.Date currentDate = new java.sql.Date(millis);

            long ageInMillis = currentDate.getTime() - birthDate.getTime();
            long ageInYears = ageInMillis / (1000 * 60 * 60 * 24 * 365);
            
            return ageInYears;
      }
}
