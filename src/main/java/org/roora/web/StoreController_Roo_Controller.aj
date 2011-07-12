// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.roora.domain.Store;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect StoreController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String StoreController.create(@Valid Store store, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("store", store);
            return "stores/create";
        }
        uiModel.asMap().clear();
        store.persist();
        return "redirect:/stores/" + encodeUrlPathSegment(store.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String StoreController.createForm(Model uiModel) {
        uiModel.addAttribute("store", new Store());
        return "stores/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String StoreController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("store", Store.findStore(id));
        uiModel.addAttribute("itemId", id);
        return "stores/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String StoreController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("stores", Store.findStoreEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Store.countStores() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("stores", Store.findAllStores());
        }
        return "stores/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String StoreController.update(@Valid Store store, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("store", store);
            return "stores/update";
        }
        uiModel.asMap().clear();
        store.merge();
        return "redirect:/stores/" + encodeUrlPathSegment(store.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String StoreController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("store", Store.findStore(id));
        return "stores/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String StoreController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Store.findStore(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/stores";
    }
    
    @ModelAttribute("stores")
    public Collection<Store> StoreController.populateStores() {
        return Store.findAllStores();
    }
    
    String StoreController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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