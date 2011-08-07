package org.roora.domain;

import java.util.List;
import javax.persistence.Column;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Store {
	@Column(unique = true)
    private String name;

	public static List<Store> findAllStores() {
        return entityManager().createQuery("SELECT o FROM Store o ORDER BY NAME", Store.class).getResultList();
    }

	public static List<Store> findStoreEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Store o ORDER BY NAME", Store.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
