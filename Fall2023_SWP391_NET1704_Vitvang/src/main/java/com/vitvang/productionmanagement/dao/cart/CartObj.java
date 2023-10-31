package com.vitvang.productionmanagement.dao.cart;

import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.model.CageDTO;
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

      // bỏ đồ tuần tự nên ko cho set public
      private Map<String, CageDTO> productItems;

      public Map<String, CageDTO> getProductItems() {
            return productItems;
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

}
