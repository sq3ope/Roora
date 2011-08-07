package org.roora.domain;

import java.util.List;
import javax.persistence.Column;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Person {

	@Column(unique = true)
    private String email;

    private String firstName;

    private String lastName;

    private String password;
    

	public static List<Person> findAllPeople() {
        return entityManager().createQuery("SELECT o FROM Person o ORDER BY LAST_NAME, FIRST_NAME", Person.class).getResultList();
    }

	public static List<Person> findPersonEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Person o ORDER BY LAST_NAME, FIRST_NAME", Person.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
