//THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
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
import org.roora.domain.MyOrder;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MyOrder_Roo_Entity {
    
    declare @type: MyOrder: @Entity;
    
    @PersistenceContext
    transient EntityManager MyOrder.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long MyOrder.id;
    
    @Version
    @Column(name = "version")
    private Integer MyOrder.version;
    
    public Long MyOrder.getId() {
        return this.id;
    }
    
    public void MyOrder.setId(Long id) {
        this.id = id;
    }
    
    public Integer MyOrder.getVersion() {
        return this.version;
    }
    
    public void MyOrder.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void MyOrder.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MyOrder.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MyOrder attached = MyOrder.findMyOrder(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MyOrder.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void MyOrder.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public MyOrder MyOrder.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MyOrder merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager MyOrder.entityManager() {
        EntityManager em = new MyOrder().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MyOrder.countMyOrders() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MyOrder o", Long.class).getSingleResult();
    }
    
        
    public static MyOrder MyOrder.findMyOrder(Long id) {
        if (id == null) return null;
        return entityManager().find(MyOrder.class, id);
    }
    
        
}
