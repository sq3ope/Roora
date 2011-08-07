// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.roora.domain.OrderItem;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OrderItem_Roo_Entity {
    
    declare @type: OrderItem: @Entity;
    
    @PersistenceContext
    transient EntityManager OrderItem.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long OrderItem.id;
    
    @Version
    @Column(name = "version")
    private Integer OrderItem.version;
    
    public Long OrderItem.getId() {
        return this.id;
    }
    
    public void OrderItem.setId(Long id) {
        this.id = id;
    }
    
    public Integer OrderItem.getVersion() {
        return this.version;
    }
    
    public void OrderItem.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void OrderItem.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void OrderItem.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            OrderItem attached = OrderItem.findOrderItem(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void OrderItem.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void OrderItem.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public OrderItem OrderItem.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OrderItem merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager OrderItem.entityManager() {
        EntityManager em = new OrderItem().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long OrderItem.countOrderItems() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OrderItem o", Long.class).getSingleResult();
    }
    
        
    public static OrderItem OrderItem.findOrderItem(Long id) {
        if (id == null) return null;
        return entityManager().find(OrderItem.class, id);
    }
    
        
}
