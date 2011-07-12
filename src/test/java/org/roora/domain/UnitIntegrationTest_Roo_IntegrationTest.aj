// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.roora.domain.UnitDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UnitIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UnitIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UnitIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: UnitIntegrationTest: @Transactional;
    
    @Autowired
    private UnitDataOnDemand UnitIntegrationTest.dod;
    
    @Test
    public void UnitIntegrationTest.testCountUnits() {
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", dod.getRandomUnit());
        long count = org.roora.domain.Unit.countUnits();
        org.junit.Assert.assertTrue("Counter for 'Unit' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UnitIntegrationTest.testFindUnit() {
        org.roora.domain.Unit obj = dod.getRandomUnit();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to provide an identifier", id);
        obj = org.roora.domain.Unit.findUnit(id);
        org.junit.Assert.assertNotNull("Find method for 'Unit' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Unit' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UnitIntegrationTest.testFindAllUnits() {
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", dod.getRandomUnit());
        long count = org.roora.domain.Unit.countUnits();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Unit', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.roora.domain.Unit> result = org.roora.domain.Unit.findAllUnits();
        org.junit.Assert.assertNotNull("Find all method for 'Unit' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Unit' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UnitIntegrationTest.testFindUnitEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", dod.getRandomUnit());
        long count = org.roora.domain.Unit.countUnits();
        if (count > 20) count = 20;
        java.util.List<org.roora.domain.Unit> result = org.roora.domain.Unit.findUnitEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Unit' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Unit' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UnitIntegrationTest.testFlush() {
        org.roora.domain.Unit obj = dod.getRandomUnit();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to provide an identifier", id);
        obj = org.roora.domain.Unit.findUnit(id);
        org.junit.Assert.assertNotNull("Find method for 'Unit' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUnit(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Unit' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UnitIntegrationTest.testMerge() {
        org.roora.domain.Unit obj = dod.getRandomUnit();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to provide an identifier", id);
        obj = org.roora.domain.Unit.findUnit(id);
        boolean modified =  dod.modifyUnit(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.roora.domain.Unit merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Unit' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UnitIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", dod.getRandomUnit());
        org.roora.domain.Unit obj = dod.getNewTransientUnit(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Unit' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Unit' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UnitIntegrationTest.testRemove() {
        org.roora.domain.Unit obj = dod.getRandomUnit();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Unit' failed to provide an identifier", id);
        obj = org.roora.domain.Unit.findUnit(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Unit' with identifier '" + id + "'", org.roora.domain.Unit.findUnit(id));
    }
    
}
