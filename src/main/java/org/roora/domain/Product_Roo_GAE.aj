package org.roora.domain;

import org.datanucleus.api.jpa.annotations.Extension;

public aspect Product_Roo_GAE {

    declare @field: * Product.id: @Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true");

    @Extension(vendorName="datanucleus", key="gae.pk-id", value="true")
    private Long Product.autoId;

    public Long Product.getAutoId() {
        return this.autoId;
    }
    
    public void Product.setAutoId(Long autoId) {
        this.autoId = autoId;
    }
	
}
