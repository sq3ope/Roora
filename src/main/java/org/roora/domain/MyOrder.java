package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.roora.domain.Store;
import javax.persistence.ManyToOne;
import org.roora.domain.Person;

@RooJavaBean
@RooToString
@RooEntity
public class MyOrder {

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date created;

    private String description;

    @ManyToOne
    private Store store;

    @ManyToOne
    private Person person;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "myOrder", orphanRemoval = true)
    private Set<OrderItem> orderItems;

	public static List<MyOrder> findAllMyOrders() {
        return entityManager().createQuery("SELECT o FROM MyOrder o ORDER BY created", MyOrder.class).getResultList();
    }

	public static List<MyOrder> findMyOrderEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MyOrder o ORDER BY created", MyOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
