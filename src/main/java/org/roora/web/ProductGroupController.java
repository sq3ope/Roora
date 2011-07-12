package org.roora.web;

import org.roora.domain.ProductGroup;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "productgroups", formBackingObject = ProductGroup.class)
@RequestMapping("/productgroups")
@Controller
public class ProductGroupController {
}
