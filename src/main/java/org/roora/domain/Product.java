package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.roora.domain.Unit;
import javax.persistence.ManyToOne;
import org.roora.domain.ProductGroup;

@RooJavaBean
@RooToString
@RooEntity
public class Product {

    private String name;

    private String status;

    @ManyToOne
    private Unit unit;

    @ManyToOne
    private ProductGroup productGroup;
}
