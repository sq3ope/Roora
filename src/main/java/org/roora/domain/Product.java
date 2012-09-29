package org.roora.domain;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@Configurable
public class Product {

    @NotNull
    private String name;
    
    private Long unitId;
  
    @Transient
    private Unit unit;

	public Unit getUnit() {
		if (unitId == null) return null;
		this.unit = entityManager().find(Unit.class, unitId);
		return this.unit;
    }

	public void setUnit(Unit unit) {
		this.unit = unit;
        this.unitId = unit.getId();
    }
}
