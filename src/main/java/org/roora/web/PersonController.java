package org.roora.web;

import org.roora.domain.Person;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "people", formBackingObject = Person.class)
@RequestMapping("/people")
@Controller
public class PersonController {
}
