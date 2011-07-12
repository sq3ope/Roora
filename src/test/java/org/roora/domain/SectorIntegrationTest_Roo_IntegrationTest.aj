// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.roora.domain.SectorDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SectorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SectorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SectorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: SectorIntegrationTest: @Transactional;
    
    @Autowired
    private SectorDataOnDemand SectorIntegrationTest.dod;
    
    @Test
    public void SectorIntegrationTest.testCountSectors() {
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", dod.getRandomSector());
        long count = org.roora.domain.Sector.countSectors();
        org.junit.Assert.assertTrue("Counter for 'Sector' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SectorIntegrationTest.testFindSector() {
        org.roora.domain.Sector obj = dod.getRandomSector();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to provide an identifier", id);
        obj = org.roora.domain.Sector.findSector(id);
        org.junit.Assert.assertNotNull("Find method for 'Sector' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Sector' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SectorIntegrationTest.testFindAllSectors() {
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", dod.getRandomSector());
        long count = org.roora.domain.Sector.countSectors();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Sector', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.roora.domain.Sector> result = org.roora.domain.Sector.findAllSectors();
        org.junit.Assert.assertNotNull("Find all method for 'Sector' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Sector' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SectorIntegrationTest.testFindSectorEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", dod.getRandomSector());
        long count = org.roora.domain.Sector.countSectors();
        if (count > 20) count = 20;
        java.util.List<org.roora.domain.Sector> result = org.roora.domain.Sector.findSectorEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Sector' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Sector' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SectorIntegrationTest.testFlush() {
        org.roora.domain.Sector obj = dod.getRandomSector();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to provide an identifier", id);
        obj = org.roora.domain.Sector.findSector(id);
        org.junit.Assert.assertNotNull("Find method for 'Sector' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySector(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Sector' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SectorIntegrationTest.testMerge() {
        org.roora.domain.Sector obj = dod.getRandomSector();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to provide an identifier", id);
        obj = org.roora.domain.Sector.findSector(id);
        boolean modified =  dod.modifySector(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.roora.domain.Sector merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Sector' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SectorIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", dod.getRandomSector());
        org.roora.domain.Sector obj = dod.getNewTransientSector(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Sector' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Sector' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SectorIntegrationTest.testRemove() {
        org.roora.domain.Sector obj = dod.getRandomSector();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Sector' failed to provide an identifier", id);
        obj = org.roora.domain.Sector.findSector(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Sector' with identifier '" + id + "'", org.roora.domain.Sector.findSector(id));
    }
    
}
