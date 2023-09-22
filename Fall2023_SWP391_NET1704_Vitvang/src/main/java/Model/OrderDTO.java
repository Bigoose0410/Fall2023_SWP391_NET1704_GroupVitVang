/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;
import java.sql.Date;


/**
 *
 * @author Admin
 */
public class OrderDTO implements Serializable {

        private String OrderrID;
        private Date StartDate;
        private Date EndDate;
        private int Quantity;
        private int Price;
        private String Delivery;
        private String Address;
        private String StatusProgress;
        private String StaffID;
        private String CustomerID;

        public OrderDTO() {
        }

        public OrderDTO(String OrderrID, Date StartDate, Date EndDate, int Quantity, int Price, String Delivery, String Address, String StatusProgress, String StaffID, String CustomerID) {
                this.OrderrID = OrderrID;
                this.StartDate = StartDate;
                this.EndDate = EndDate;
                this.Quantity = Quantity;
                this.Price = Price;
                this.Delivery = Delivery;
                this.Address = Address;
                this.StatusProgress = StatusProgress;
                this.StaffID = StaffID;
                this.CustomerID = CustomerID;
        }

        public String getOrderrID() {
                return OrderrID;
        }

        public void setOrderrID(String OrderrID) {
                this.OrderrID = OrderrID;
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

        public int getQuantity() {
                return Quantity;
        }

        public void setQuantity(int Quantity) {
                this.Quantity = Quantity;
        }

        public int getPrice() {
                return Price;
        }

        public void setPrice(int Price) {
                this.Price = Price;
        }

        public String getDelivery() {
                return Delivery;
        }

        public void setDelivery(String Delivery) {
                this.Delivery = Delivery;
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

        public String getStaffID() {
                return StaffID;
        }

        public void setStaffID(String StaffID) {
                this.StaffID = StaffID;
        }

        public String getCustomerID() {
                return CustomerID;
        }

        public void setCustomerID(String CustomerID) {
                this.CustomerID = CustomerID;
        }

}
