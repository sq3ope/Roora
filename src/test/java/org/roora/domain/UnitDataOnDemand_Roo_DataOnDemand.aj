// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.roora.domain.Unit;
import org.springframework.stereotype.Component;

privileged aspect UnitDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UnitDataOnDemand: @Component;
    
    private Random UnitDataOnDemand.rnd = new SecureRandom();
    
    private List<Unit> UnitDataOnDemand.data;
    
    public Unit UnitDataOnDemand.getNewTransientUnit(int index) {
        Unit obj = new Unit();
        setName(obj, index);
        return obj;
    }
    
    public void UnitDataOnDemand.setName(Unit obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Unit UnitDataOnDemand.getSpecificUnit(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Unit obj = data.get(index);
        return Unit.findUnit(obj.getId());
    }
    
    public Unit UnitDataOnDemand.getRandomUnit() {
        init();
        Unit obj = data.get(rnd.nextInt(data.size()));
        return Unit.findUnit(obj.getId());
    }
    
    public boolean UnitDataOnDemand.modifyUnit(Unit obj) {
        return false;
    }
    
    public void UnitDataOnDemand.init() {
        data = Unit.findUnitEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Unit' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.roora.domain.Unit>();
        for (int i = 0; i < 10; i++) {
            Unit obj = getNewTransientUnit(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
