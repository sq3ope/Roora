package org.roora.web;

import org.roora.domain.Person;
import org.roora.domain.ProductStatus;
import org.roora.domain.Sector;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.RooConversionService;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {		
		super.installFormatters(registry);
		// Register application converters and formatters
		registry.addConverter(new PersonConverter());
	}
	
	static class PersonConverter implements org.springframework.core.convert.converter.Converter<org.roora.domain.Person, java.lang.String>  {
	    public String convert(Person person) {
	    	return new StringBuilder().append(person.getFirstName()).append(" ")
	    	.append(person.getLastName()).toString();
	    }	    
	}
}


