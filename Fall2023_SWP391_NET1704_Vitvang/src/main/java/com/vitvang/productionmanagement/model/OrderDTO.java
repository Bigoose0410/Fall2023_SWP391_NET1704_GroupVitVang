/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class OrderDTO implements Serializable {

        private String OrderID;
        private Date StartDate;
        private Date EndDate;
        private int TotalPrice;
        private String Address;
        private String StatusProgress;



        public OrderDTO() {
        }

        public OrderDTO(String OrderID, Date StartDate, Date EndDate, int TotalPrice, String Address, String StatusProgress) {
                this.OrderID = OrderID;
                this.StartDate = StartDate;
                this.EndDate = EndDate;
                this.TotalPrice = TotalPrice;
                this.Address = Address;
                this.StatusProgress = StatusProgress;
        }

        public String getOrderID() {
                return OrderID;
        }

        public void setOrderID(String OrderID) {
                this.OrderID = OrderID;
        }

        public Date getStartDate() {
                return StartDate;
        }

        public void setStartDate(Date StartDate) {
                this.StartDate = StartDate;
        }

        public Date getEndDate() {
                return EndDate;
        }

        public void setEndDate(Date EndDate) {
                this.EndDate = EndDate;
        }

        public int getTotalPrice() {
                return TotalPrice;
        }

        public void setTotalPrice(int TotalPrice) {
                this.TotalPrice = TotalPrice;
        }

        public String getAddress() {
                return Address;
        }

        public void setAddress(String Address) {
                this.Address = Address;
        }

        public String getStatusProgress() {
                return StatusProgress;
        }

        public void setStatusProgress(String StatusProgress) {
                this.StatusProgress = StatusProgress;
        }


}
