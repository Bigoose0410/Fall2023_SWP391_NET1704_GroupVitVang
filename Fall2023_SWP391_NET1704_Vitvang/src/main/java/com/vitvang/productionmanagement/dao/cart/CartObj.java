package com.vitvang.productionmanagement.dao.cart;

import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.dao.cage.CageDAO;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author thetam
 */
public class CartObj {

      private Map<String, CageDTO> productItems;

      public Map<String, CageDTO> getProductItems() {
            return productItems;
      }

      private Map<String, Integer> items;

      // bỏ đồ tuần tự nên ko cho set public
      public Map<String, Integer> getItems() {
            return items;
      }

      //
      public void addItemToCart(String sku) {
            if (sku == null) {
                  return;
            }
            if (sku.trim().isEmpty()) {
                  return;
            }
            // 1. Check existed cart / items
            if (this.items == null) {
                  this.items = new HashMap<>();
            }
            // 2. Check existed item
            int quantity = 1;
            if (this.items.containsKey(sku)) {
                  quantity = this.items.get(sku) + 1;
            }
            // 3. Update items
            this.items.put(sku, quantity);
      }

      public void addCageToCart(String sku, int quantity) throws SQLException, NamingException {
            if (sku == null) {
                  return;
            }
            if (sku.trim().isEmpty()) {
                  return;
            }
            // 1. Check existed cart / items
            if (this.productItems == null) {
                  this.productItems = new HashMap<>();
            }
            // 2. Check existed item
            CageDAO dao = new CageDAO();
            dao.AllProduction();
            CageDTO dto = dao.getCageDTObyID(sku);
            if (this.productItems.get(sku) != null) {
                  dto.setQuantityOrder(this.productItems.get(sku).getQuantityOrder() + quantity);
            } else{
                   dto.setQuantityOrder(quantity);
            }
            // 3. Update items
            this.productItems.put(sku, dto);
      }

      public void addManyItemToCart(String sku, Integer quantity) {
            if (sku == null) {
                  return;
            }
            if (sku.trim().isEmpty() || quantity == 0) {
                  return;
            }
            //1. check existed cart / items
            if (this.items == null) {
                  this.items = new HashMap<>();
            }
            //2. check exíted item
            if (this.items.containsKey(sku)) {
                  quantity = this.items.get(sku) + quantity;
            }
            //3. update items
            this.items.put(sku, quantity);
      }

      public void removeItemFromCart(String sku) {
            // method nay remove tat ca
            //remove 1 mon ra khoi gio thi add item bang so am

            //1. Check existed items |ngan chua do
            if (this.items == null) {
                  return;
            }
            //2. check exist item |mon do
            if (this.items.containsKey(sku)) {
                  //3. Romove item from items
                  this.items.remove(sku);
                  if (this.items.isEmpty()) {    // neu doi tuong khong chua gi thi gan null de sau nay de check lai
                        this.items = null;
                  }

            }
      }

      public void removeItemFromPay(String sku) {
            // method nay remove tat ca
            //remove 1 mon ra khoi gio thi add item bang so am

            //1. Check existed items |ngan chua do
            if (this.productItems == null) {
                  return;
            }
            //2. check exist item |mon do
            if (this.productItems.containsKey(sku)) {
                  //3. Romove item from items
                  this.productItems.remove(sku);
                  if (this.productItems.isEmpty()) {    // neu doi tuong khong chua gi thi gan null de sau nay de check lai
                        this.productItems = null;
                  }
            }
      }

      public void RemoveManyItemToCart(String sku, Integer quantity) {
            // method nay remove tat ca
            //remove 1 mon ra khoi gio thi add item bang so am
            int itemquantity = this.items.get(sku);  // lay quantity hien tai cua item
            //1. Check existed items |ngan chua do
            if (this.items == null) {
                  return;
            }
            //2. check exist item | mon do
            if (this.items.containsKey(sku)) {
                  // neu mon do co ton tai va so luong muon xoa > so luong san co thi remove mon hang
                  //3. Romove item from items
                  if (itemquantity == quantity) {
                        this.items.remove(sku);
                  } else {
                        this.items.put(sku, itemquantity - quantity);
                  }
            }
            if (this.items.isEmpty()) {    // neu doi tuong khong chua gi thi gan null de sau nay de check lai de hon
                  this.items = null;
            }
      }
}
