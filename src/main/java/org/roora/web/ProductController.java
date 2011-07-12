package org.roora.web;

import org.roora.domain.Product;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "products", formBackingObject = Product.class)
@RequestMapping("/products")
@Controller
public class ProductController {
}
