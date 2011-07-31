package org.roora.domain;

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
    
}
