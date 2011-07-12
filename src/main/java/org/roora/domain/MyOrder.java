package org.roora.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
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
}
