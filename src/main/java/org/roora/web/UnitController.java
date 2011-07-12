package org.roora.web;

import org.roora.domain.Unit;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "units", formBackingObject = Unit.class)
@RequestMapping("/units")
@Controller
public class UnitController {
}
