package org.roora.web;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.roora.domain.MyOrder;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "myorders", formBackingObject = MyOrder.class)
@RequestMapping("/myorders")
@Controller
public class MyOrderController {
	
	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid MyOrder myOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("myOrder", myOrder);
            addDateTimeFormatPatterns(uiModel);
            return "myorders/create";
        }
        uiModel.asMap().clear();
        myOrder.setCreated(Calendar.getInstance().getTime());
        myOrder.persist();
        return "redirect:/myorders/" + encodeUrlPathSegment(myOrder.getId().toString(), httpServletRequest);
    }


	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model uiModel) {
		MyOrder myOrder = new MyOrder();
		myOrder.setCreated(Calendar.getInstance().getTime());
        uiModel.addAttribute("myOrder", myOrder);
        addDateTimeFormatPatterns(uiModel);
        return "myorders/create";
    }
}
