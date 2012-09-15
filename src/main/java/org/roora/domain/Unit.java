package org.roora.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = String.class)
public class Unit {

    @NotNull
    private String name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "unit")
    private Set<Product> products = new HashSet<Product>();
}
