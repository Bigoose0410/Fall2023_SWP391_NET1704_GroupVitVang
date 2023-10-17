/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author Admin
 */
public final class tool {

      private static final String IGNORE_CASE_PATTERN = "(?i)";

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

      public static Date calculateProcessDate(Date startDate, int quantity, int timeprocess ,int employee, int maxConpletionperDay ) {
            
            double maxConpletion = (maxConpletionperDay * 1d /employee);
//            int employee = 3;
//            int timeprocess = 2;
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
}
