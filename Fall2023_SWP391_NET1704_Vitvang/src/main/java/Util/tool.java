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
}
