package org.roora.web;

import org.roora.domain.Store;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "stores", formBackingObject = Store.class)
@RequestMapping("/stores")
@Controller
public class StoreController {
}
