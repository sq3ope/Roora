// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import java.lang.String;

privileged aspect Sector_Roo_ToString {
    
    public String Sector.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("OrderNum: ").append(getOrderNum()).append(", ");
        sb.append("ProductGroups: ").append(getProductGroups() == null ? "null" : getProductGroups().size()).append(", ");
        sb.append("Store: ").append(getStore()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}