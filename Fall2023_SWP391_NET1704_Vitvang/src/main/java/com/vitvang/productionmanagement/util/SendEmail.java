/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.util;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author TheTam
 */
public class SendEmail {

      final static String fromEmail = "thetamthd@gmail.com";
      final static String emailpassword = "urrs ruvu rrth qdfu";

      public static boolean sendEmailAccount(String toEmail, String username, String password, String subject) {
            // properties : khai baso thuoc tinh
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            //authenticator
            Authenticator authen = new Authenticator() {
                  @Override
                  protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, emailpassword);
                  }

            };
            // Phien lam viec cua mail
            Session seesion = Session.getInstance(props, authen);

            //gui email
            //1. tao 1 tn moi
            MimeMessage msg = new MimeMessage(seesion);
            try {
                  //kieu noi dung
                  msg.addHeader("Content-type", "text-HTML; charset=UTF8");
                  // nguoi gui
                  msg.setFrom(fromEmail);
                  //nguoi nhan
                  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
                  //noi dung 
                  msg.setSubject(subject);
                  //quy dinh ngay gui
                  msg.setContent(
                          "    <body>\n"
                                  + "<h1>Bird cage production Management Annountment</h1>"
                          + "        <p>You already have an account to tracking your order</p>\n"
                          + "        <table border=\"1\">\n"
                          + "            <thead>\n"
                          + "                <tr>\n"
                          + "                    <th>Username</th>\n"
                          + "                    <th>password</th>\n"
                          + "                </tr>\n"
                          + "            </thead>\n"
                          + "            <tbody>\n"
                          + "                <tr>\n"
                          + "                    <td>" + username + "</td>\n"
                          + "                    <td>" + password + "</td>\n"
                          + "                </tr>\n"
                          + "            </tbody>\n"
                          + "        </table>\n"
                          + "\n"
                          + "    </body>\n", "text/html");

                  Transport.send(msg);
                  return true;
            } catch (Exception ex) {
                  ex.printStackTrace();
            }
            return false;
      }

      public static void main(String[] args) {
            boolean result = sendEmailAccount("nhatlmse171573@fpt.edu.vn", "CS004", "123456", "Test email");
            if (result == true) {
                  System.out.println("Gui thanh cong");
            }
      }

}
