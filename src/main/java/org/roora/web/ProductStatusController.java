package org.roora.web;

import org.roora.domain.ProductStatus;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "productstatuses", formBackingObject = ProductStatus.class)
@RequestMapping("/productstatuses")
@Controller
public class ProductStatusController {
}
