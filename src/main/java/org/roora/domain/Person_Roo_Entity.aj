//IT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
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
import org.roora.domain.Person;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Person_Roo_Entity {
    
    declare @type: Person: @Entity;
    
    @PersistenceContext
    transient EntityManager Person.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Person.id;
    
    @Version
    @Column(name = "version")
    private Integer Person.version;
    
    public Long Person.getId() {
        return this.id;
    }
    
    public void Person.setId(Long id) {
        this.id = id;
    }
    
    public Integer Person.getVersion() {
        return this.version;
    }
    
    public void Person.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Person.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Person.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Person attached = Person.findPerson(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Person.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Person.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Person Person.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Person merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Person.entityManager() {
        EntityManager em = new Person().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Person.countPeople() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Person o", Long.class).getSingleResult();
    }
    
        
    public static Person Person.findPerson(Long id) {
        if (id == null) return null;
        return entityManager().find(Person.class, id);
    }
    
        
}
