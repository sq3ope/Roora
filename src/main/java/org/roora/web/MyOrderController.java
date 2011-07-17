package org.roora.web;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import oracle.sql.DATE;

import org.apache.log4j.Logger;
import org.roora.domain.MyOrder;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid MyOrder myOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("myOrder", myOrder);
            addDateTimeFormatPatterns(uiModel);
            return "myorders/update";
        }
        System.out.println(myOrder.getCreated());
        //myOrder.setCreated((Date) uiModel.asMap().get("createdBackup"));
        
        uiModel.asMap().clear();
        myOrder.merge();
        return "redirect:/myorders/" + encodeUrlPathSegment(myOrder.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
		MyOrder myOrder = MyOrder.findMyOrder(id);
        uiModel.addAttribute("myOrder", myOrder);
        System.out.println(myOrder.getCreated());
        uiModel.addAttribute("createdBackup", myOrder.getCreated());
        addDateTimeFormatPatterns(uiModel);
        return "myorders/update";
    }
}
