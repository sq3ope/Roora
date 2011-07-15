package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.roora.domain.Unit;
import javax.persistence.ManyToOne;
import org.roora.domain.ProductGroup;
import org.roora.domain.ProductStatus;

@RooJavaBean
@RooToString
@RooEntity
public class Product {

    private String name;

    @ManyToOne
    private Unit unit;

    @ManyToOne
    private ProductGroup productGroup;

    @ManyToOne
    private ProductStatus status;
}
