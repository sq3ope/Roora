package org.roora.web;

import org.roora.domain.MyOrder;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "myorders", formBackingObject = MyOrder.class)
@RequestMapping("/myorders")
@Controller
public class MyOrderController {
}
