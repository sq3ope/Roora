//HIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.roora.domain.MyOrder;
import org.roora.domain.Person;
import org.roora.domain.Store;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MyOrderController_Roo_Controller {
    
        
        
    @RequestMapping(method = RequestMethod.PUT)
    public String MyOrderController.update(@Valid MyOrder myOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("myOrder", myOrder);
            addDateTimeFormatPatterns(uiModel);
            return "myorders/update";
        }
        
        uiModel.asMap().clear();
        myOrder.merge();
        return "redirect:/myorders/" + encodeUrlPathSegment(myOrder.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MyOrderController.updateForm(@PathVariable("id") Long id, Model uiModel) {
		MyOrder myOrder = MyOrder.findMyOrder(id);
        uiModel.addAttribute("myOrder", myOrder);
        addDateTimeFormatPatterns(uiModel);
        return "myorders/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MyOrderController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("myorder", MyOrder.findMyOrder(id));
        uiModel.addAttribute("itemId", id);
        return "myorders/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MyOrderController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("myorders", MyOrder.findMyOrderEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) MyOrder.countMyOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("myorders", MyOrder.findAllMyOrders());
        }
        addDateTimeFormatPatterns(uiModel);
        return "myorders/list";
    }
    
        
        
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MyOrderController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MyOrder.findMyOrder(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/myorders";
    }
    
    @ModelAttribute("myorders")
    public Collection<MyOrder> MyOrderController.populateMyOrders() {
        return MyOrder.findAllMyOrders();
    }
    
    @ModelAttribute("people")
    public java.util.Collection<Person> MyOrderController.populatePeople() {
        return Person.findAllPeople();
    }
    
    @ModelAttribute("stores")
    public java.util.Collection<Store> MyOrderController.populateStores() {
        return Store.findAllStores();
    }
    
    void MyOrderController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("myOrder_created_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String MyOrderController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
