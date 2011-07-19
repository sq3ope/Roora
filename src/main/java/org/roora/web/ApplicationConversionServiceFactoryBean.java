package org.roora.web;

import java.text.SimpleDateFormat;

import org.roora.domain.MyOrder;
import org.roora.domain.Person;
import org.roora.domain.Product;
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
		registry.addConverter(new ProductConverter());
		registry.addConverter(new MyOrderConverter());
	}
	
	static class PersonConverter implements org.springframework.core.convert.converter.Converter<org.roora.domain.Person, java.lang.String>  {
	    public String convert(Person person) {
	    	return new StringBuilder().append(person.getFirstName()).append(" ")
	    	.append(person.getLastName()).toString();
	    }	    
	}
	
	static class ProductConverter implements org.springframework.core.convert.converter.Converter<org.roora.domain.Product, java.lang.String>  {
	    public String convert(Product product) {
	    	return product.getName();
	    }	    
	}
	
    static class MyOrderConverter implements Converter<MyOrder, String>  {
        public String convert(MyOrder myOrder) {
	        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	        return new StringBuilder().append(fmt.format(myOrder.getCreated()))
	        	.append("/").append(myOrder.getDescription()).toString();
        }        
    }

}


