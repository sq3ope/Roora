package org.roora.web;

import org.roora.domain.OrderItem;
import org.roora.domain.Product;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "orderitems", formBackingObject = OrderItem.class)
@RequestMapping("/orderitems")
@Controller
public class OrderItemController {

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model uiModel) {
		OrderItem orderItem = new OrderItem();
        uiModel.addAttribute("orderItem", orderItem);
        return "orderitems/create";
    }
}
