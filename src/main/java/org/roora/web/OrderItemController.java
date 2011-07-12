package org.roora.web;

import org.roora.domain.OrderItem;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "orderitems", formBackingObject = OrderItem.class)
@RequestMapping("/orderitems")
@Controller
public class OrderItemController {
}
