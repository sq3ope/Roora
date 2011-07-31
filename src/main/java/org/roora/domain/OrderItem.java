package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.math.BigDecimal;
import org.roora.domain.Unit;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.roora.domain.MyOrder;
import org.roora.domain.Product;

@RooJavaBean
@RooToString
@RooEntity
@Table(uniqueConstraints = {@UniqueConstraint(columnNames={"my_order", "product"})}
	)
public class OrderItem {

    private BigDecimal quantity;

    private String description;

    @ManyToOne
    private Unit unit;

    @ManyToOne
    private MyOrder myOrder;

    @ManyToOne
    private Product product;
}
