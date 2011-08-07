package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class ProductGroup {
	@Column(unique = true)
    private String name;

    @ManyToOne
    private org.roora.domain.ProductGroup productGroup;
        

	public static List<ProductGroup> findAllProductGroups() {
        return entityManager().createQuery("SELECT o FROM ProductGroup o ORDER BY PRODUCT_GROUP, NAME", ProductGroup.class).getResultList();
    }

	public static List<ProductGroup> findProductGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProductGroup o ORDER BY PRODUCT_GROUP, NAME", ProductGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
