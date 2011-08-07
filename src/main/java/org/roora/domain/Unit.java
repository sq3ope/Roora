package org.roora.domain;

import java.util.List;
import javax.persistence.Column;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Unit {

    @Column(unique = true)
    private String name;

	public static List<Unit> findAllUnits() {
        return entityManager().createQuery("SELECT o FROM Unit o ORDER BY NAME", Unit.class).getResultList();
    }

	public static List<Unit> findUnitEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Unit o ORDER BY NAME", Unit.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
