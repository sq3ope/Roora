package org.roora.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.roora.domain.Product;
import org.roora.reference.ProductStatus;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "products", formBackingObject = Product.class)
@RequestMapping("/products")
@Controller
public class ProductController {

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("product", product);
            return "products/create";
        }
        
        uiModel.asMap().clear();        
        product.persist();
        return "redirect:/products/" + encodeUrlPathSegment(product.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model uiModel) {
		Product product = new Product();
		product.setStatus(ProductStatus.ACTIVE);
        uiModel.addAttribute("product", product);
        return "products/create";
    }
}
