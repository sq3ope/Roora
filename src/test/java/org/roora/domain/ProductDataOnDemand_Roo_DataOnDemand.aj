// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.roora.domain.Product;
import org.roora.domain.ProductDataOnDemand;
import org.roora.domain.Unit;
import org.roora.domain.UnitDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProductDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductDataOnDemand: @Component;
    
    private Random ProductDataOnDemand.rnd = new SecureRandom();
    
    private List<Product> ProductDataOnDemand.data;
    
    @Autowired
    private UnitDataOnDemand ProductDataOnDemand.unitDataOnDemand;
    
    public Product ProductDataOnDemand.getNewTransientProduct(int index) {
        Product obj = new Product();
        setName(obj, index);
        setUnit(obj, index);
        return obj;
    }
    
    public void ProductDataOnDemand.setName(Product obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ProductDataOnDemand.setUnit(Product obj, int index) {
        Unit unit = unitDataOnDemand.getRandomUnit();
        obj.setUnit(unit);
    }
    
    public Product ProductDataOnDemand.getSpecificProduct(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Product obj = data.get(index);
        String id = obj.getId();
        return Product.findProduct(id);
    }
    
    public Product ProductDataOnDemand.getRandomProduct() {
        init();
        Product obj = data.get(rnd.nextInt(data.size()));
        String id = obj.getId();
        return Product.findProduct(id);
    }
    
    public boolean ProductDataOnDemand.modifyProduct(Product obj) {
        return false;
    }
    
    public void ProductDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Product.findProductEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Product' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Product>();
        for (int i = 0; i < 10; i++) {
            Product obj = getNewTransientProduct(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
