package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class ProductGroup {

    private String name;

    @ManyToOne
    private org.roora.domain.ProductGroup productGroup;
}
