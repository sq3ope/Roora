// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.lang.String;

privileged aspect Product_Roo_ToString {
    
    public String Product.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("ProductGroup: ").append(getProductGroup()).append(", ");
        sb.append("Status: ").append(getStatus()).append(", ");
        sb.append("Unit: ").append(getUnit()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
