// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.lang.Long;
import java.lang.String;
import java.util.Set;
import org.roora.domain.ProductGroup;
import org.roora.domain.Store;

privileged aspect Sector_Roo_JavaBean {
    
    public String Sector.getName() {
        return this.name;
    }
    
    public void Sector.setName(String name) {
        this.name = name;
    }
    
    public Long Sector.getOrderNum() {
        return this.orderNum;
    }
    
    public void Sector.setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }
    
    public Store Sector.getStore() {
        return this.store;
    }
    
    public void Sector.setStore(Store store) {
        this.store = store;
    }
    
    public Set<ProductGroup> Sector.getProductGroups() {
        return this.productGroups;
    }
    
    public void Sector.setProductGroups(Set<ProductGroup> productGroups) {
        this.productGroups = productGroups;
    }
    
}