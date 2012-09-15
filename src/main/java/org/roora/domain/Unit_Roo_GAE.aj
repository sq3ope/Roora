package org.roora.domain;

import org.datanucleus.api.jpa.annotations.Extension;

public aspect Unit_Roo_GAE {

    declare @field: * Unit.id: @Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true");

    @Extension(vendorName="datanucleus", key="gae.pk-id", value="true")
    private Long Unit.autoId;

    public Long Unit.getAutoId() {
        return this.autoId;
    }
    
    public void Unit.setAutoId(Long autoId) {
        this.autoId = autoId;
    }
	
}
