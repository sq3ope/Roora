package org.roora.web;

import java.util.Collection;

import org.roora.domain.ProductGroup;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "productgroups", formBackingObject = ProductGroup.class)
@RequestMapping("/productgroups")
@Controller
public class ProductGroupController {
	ProductGroup nullProductGroup;
	
	public ProductGroupController() {
		nullProductGroup = new ProductGroup();
		nullProductGroup.setId(-1L);
		nullProductGroup.setName("-");
	}
	
	@ModelAttribute("productgroups")
    public Collection<ProductGroup> populateProductGroups() {
    	Collection<ProductGroup> groups = ProductGroup.findAllProductGroups();
    	groups.add(nullProductGroup);
        return groups;
    }
	
	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
		ProductGroup foundProductGroup = ProductGroup.findProductGroup(id);
		
		if (foundProductGroup != null) {
			if (foundProductGroup.getProductGroup() == null)
				foundProductGroup.setProductGroup(nullProductGroup);
		}
			
		uiModel.addAttribute("productGroup", foundProductGroup);
			
        return "productgroups/update";
    }
}
