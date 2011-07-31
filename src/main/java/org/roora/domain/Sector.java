package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.roora.domain.Store;
import javax.persistence.ManyToOne;
import java.util.Set;
import org.roora.domain.ProductGroup;
import java.util.HashSet;

import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@RooJavaBean
@RooToString
@RooEntity
@Table(uniqueConstraints = {@UniqueConstraint(columnNames={"name", "store"})}
	)
public class Sector {

    private String name;

    private Long orderNum;

    @ManyToOne
    private Store store;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ProductGroup> productGroups = new HashSet<ProductGroup>();
}
