package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.roora.domain.Store;
import javax.persistence.ManyToOne;
import java.util.Set;
import org.roora.domain.ProductGroup;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class Sector {

    private String name;

    private Long orderNum;

    @ManyToOne
    private Store store;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ProductGroup> productGroups = new HashSet<ProductGroup>();
}
