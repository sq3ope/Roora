// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.util.List;
import java.util.Random;
import org.roora.domain.Product;
import org.roora.domain.ProductGroupDataOnDemand;
import org.roora.domain.UnitDataOnDemand;
import org.roora.reference.ProductStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProductDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductDataOnDemand: @Component;
    
    private Random ProductDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Product> ProductDataOnDemand.data;
    
    @Autowired
    private UnitDataOnDemand ProductDataOnDemand.unitDataOnDemand;
    
    @Autowired
    private ProductGroupDataOnDemand ProductDataOnDemand.productGroupDataOnDemand;
    
    public Product ProductDataOnDemand.getNewTransientProduct(int index) {
        org.roora.domain.Product obj = new org.roora.domain.Product();
        setName(obj, index);
        setUnit(obj, index);
        setProductGroup(obj, index);
        setStatus(obj, index);
        return obj;
    }
    
    private void ProductDataOnDemand.setName(Product obj, int index) {
        java.lang.String name = "name_" + index;
        obj.setName(name);
    }
    
    private void ProductDataOnDemand.setUnit(Product obj, int index) {
        org.roora.domain.Unit unit = unitDataOnDemand.getRandomUnit();
        obj.setUnit(unit);
    }
    
    private void ProductDataOnDemand.setProductGroup(Product obj, int index) {
        org.roora.domain.ProductGroup productGroup = productGroupDataOnDemand.getRandomProductGroup();
        obj.setProductGroup(productGroup);
    }
    
    private void ProductDataOnDemand.setStatus(Product obj, int index) {
        ProductStatus status = ProductStatus.ACTIVE;
        obj.setStatus(status);
    }
    
    public Product ProductDataOnDemand.getSpecificProduct(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Product obj = data.get(index);
        return Product.findProduct(obj.getId());
    }
    
    public Product ProductDataOnDemand.getRandomProduct() {
        init();
        Product obj = data.get(rnd.nextInt(data.size()));
        return Product.findProduct(obj.getId());
    }
    
    public boolean ProductDataOnDemand.modifyProduct(Product obj) {
        return false;
    }
    
    public void ProductDataOnDemand.init() {
        data = org.roora.domain.Product.findProductEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Product' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.roora.domain.Product>();
        for (int i = 0; i < 10; i++) {
            org.roora.domain.Product obj = getNewTransientProduct(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
