/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;


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
            int monthIndex = startDate.getMonth();

            if (time > 30 && time < 61) {
                  for (int i = 0; i <= (int) mountcount; i++) {
                        c1.roll(Calendar.MONTH, 1);
                        System.out.println(monthIndex);
                        monthIndex++;
                        if (c1.getTime().getMonth() < startDate.getMonth() && monthIndex != 0 && monthIndex % 12 == 0) {
                              c1.roll(Calendar.YEAR, 1);
                        }
                  }
            } else if (time > 30) {

                  for (int i = 1; i <= (int) mountcount; i++) {
                        c1.roll(Calendar.MONTH, 1);
                        System.out.println(monthIndex);
                        monthIndex++;
                        if (c1.getTime().getMonth() < startDate.getMonth() && monthIndex != 0 && monthIndex % 12 == 0) {
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

      // tang 1 ngay tu ngay nhap vao
      public static Date nextdate(Date startDate) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c1 = Calendar.getInstance();

            c1.setTime(startDate);
            c1.roll(Calendar.DATE, 1);

            if (c1.getTime().getDate() < startDate.getDate()) {
                  c1.roll(Calendar.MONTH, 1);
            }
            if (c1.getTime().getMonth() < startDate.getMonth()) {
                  c1.roll(Calendar.YEAR, 1);
            }

            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            // Ngày kết thúc của quy trình
            String processEndDate = formatter.format(c1.getTime());
            Date EndDate = Date.valueOf(processEndDate);
            return EndDate;
      }

      public static int calculateDateReduce(Date dateInPlan, Date DateReal) {

//            int saveDate = 0;
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c1 = Calendar.getInstance();
            Calendar c2 = Calendar.getInstance();
            // Tính thời gian được rút ngắn
            // nếu nagỳ dự tính < ngày thưucj tế thì lấy 31  - thựuc tế + dự tính
            c1.setTime(dateInPlan);  // ngay du tinh
            c2.setTime(DateReal);    // hoan thanh thuc te

            long distancetime = c1.getTimeInMillis() - c2.getTimeInMillis();
//            if (c1.getTime().getDate() < c2.getTime().getDate()) {
//                  saveDate = 31 - c1.getTime().getDate() + c2.getTime().getDate();
//            } else {
//                  saveDate = c1.getTime().getDate() - c2.getTime().getDate();
//            }
            int difference_In_Days
                    = (int) ((distancetime
                    / (1000 * 60 * 60 * 24))
                    % 365);
            return difference_In_Days;
      }

      public static Date DateAfterReduce(Date startDate, int saveDate) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c1 = Calendar.getInstance();
            c1.setTime(startDate);
            c1.roll(Calendar.DATE, -saveDate);
            // tinhs soo thang se giam
            double mountcount = Math.floor(saveDate / 30);
            int monthIndex = 12 - startDate.getMonth();
//            if (saveDate < 30) {
//                  mountcount = 1;
//            } else {
//                  mountcount = mountcount + 1.0;
//            }
            // neu ngay giam lon hon 1 thang thi phai giam nhieu thang
            if (saveDate > 30 && saveDate < 61) {
                  for (int i = 0; i <= (int) mountcount; i++) {
                        c1.roll(Calendar.MONTH, -1);
                        System.out.println(monthIndex);
                        monthIndex++;
                        if (c1.getTime().getMonth() > startDate.getMonth() && monthIndex != 0 && monthIndex % 12 == 0) {
                              c1.roll(Calendar.YEAR, -1);
                        }
                  }
            } else if (saveDate > 30) {
                  for (int i = 1; i <= (int) mountcount; i++) {
                        c1.roll(Calendar.MONTH, -1);
                         monthIndex++;
                        if (c1.getTime().getMonth() > startDate.getMonth() && monthIndex != 0 && monthIndex % 12 == 0) {
                              c1.roll(Calendar.YEAR, -1);
                        }
                  }
            } else {
                  // neu ngay sau giam lon hon ngay trc giam thi thang giam 1
                  if (c1.getTime().getDate() > startDate.getDate()) {
                        c1.roll(Calendar.MONTH, -1);
                  }
                  // neu thang sau giam lon hon trc khi giam thi nam giam 1
                  if (c1.getTime().getMonth() > startDate.getMonth()) {
                        c1.roll(Calendar.YEAR, -1);
                  }
            }
            // Ngày bắt đầu của quy trình này là ngày kết thúc của quy trình trước
            // Ngày kết thúc của quy trình
            String processEndDate = formatter.format(c1.getTime());
            Date EndDate = Date.valueOf(processEndDate);
//            System.out.println(EndDate);
            return EndDate;
      }

      public static void main(String[] args) {
            Date date1 = new Date(2023, 10, 3);
            Date date2 = new Date(2023, 9, 7);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c1 = Calendar.getInstance();
            c1.setTime(date1);
//            c1.roll(Calendar.DATE, -7);
//            System.out.println(c1.getTime().getDate());
//            int savedate =  calculateDateReduce(date1, date2);
//            date1 = DateAfterReduce(date1, 40);
            System.out.println(date1.getDate() + "," + date1.getMonth() + "," + date1.getYear());
//            System.out.println(savedate);
            long timeminus = TimeUnit.MILLISECONDS.convert(40, TimeUnit.DAYS);
            System.out.println(timeminus);
            c1.add(Calendar.DATE, 400);
            int newmonth = c1.getTime().getMonth();
            if (12 - date1.getMonth() < Math.ceil(400 / 30)) {
                  date1 = new Date(c1.getTime().getYear(), c1.getTime().getMonth() + 1, c1.getTime().getDate());
                  System.out.println(date1.getDate() + "/" + date1.getMonth() + "/" + date1.getYear());

            }
            System.out.println(c1.getTime().getDate() + "/month" + c1.getTime().getMonth() + "/" + c1.getTime().getYear());
            System.out.println(c1.getTime());
            System.out.println("------------");
      }

      public static long getVaildYob(Date birthDate) {
            long millis = System.currentTimeMillis();
            java.sql.Date currentDate = new java.sql.Date(millis);

            long ageInMillis = currentDate.getTime() - birthDate.getTime();
            long ageInYears = ageInMillis / (1000 * 60 * 60 * 24 * 365);

            return ageInYears;
      }
}