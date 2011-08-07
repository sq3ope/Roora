package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.roora.domain.Unit;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import org.roora.domain.ProductGroup;
import org.roora.reference.ProductStatus;
import javax.validation.constraints.NotNull;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooEntity
public class Product {
	@Column(unique = true)
    private String name;

    @ManyToOne
    private Unit unit;

    @ManyToOne
    private ProductGroup productGroup;

    @NotNull
    @Enumerated
    private ProductStatus status;

	public static List<Product> findAllProducts() {
        return entityManager().createQuery("SELECT o FROM Product o ORDER BY NAME", Product.class).getResultList();
    }

	public static List<Product> findProductEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Product o ORDER BY NAME", Product.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
