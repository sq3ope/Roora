package org.roora.web;

import org.roora.domain.Sector;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "sectors", formBackingObject = Sector.class)
@RequestMapping("/sectors")
@Controller
public class SectorController {
}
