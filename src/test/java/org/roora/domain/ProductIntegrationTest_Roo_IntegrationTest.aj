// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.roora.domain.ProductDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProductIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProductIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: ProductIntegrationTest: @Transactional;
    
    @Autowired
    private ProductDataOnDemand ProductIntegrationTest.dod;
    
    @Test
    public void ProductIntegrationTest.testCountProducts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = org.roora.domain.Product.countProducts();
        org.junit.Assert.assertTrue("Counter for 'Product' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProductIntegrationTest.testFindProduct() {
        org.roora.domain.Product obj = dod.getRandomProduct();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = org.roora.domain.Product.findProduct(id);
        org.junit.Assert.assertNotNull("Find method for 'Product' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Product' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProductIntegrationTest.testFindAllProducts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = org.roora.domain.Product.countProducts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Product', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.roora.domain.Product> result = org.roora.domain.Product.findAllProducts();
        org.junit.Assert.assertNotNull("Find all method for 'Product' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Product' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProductIntegrationTest.testFindProductEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = org.roora.domain.Product.countProducts();
        if (count > 20) count = 20;
        java.util.List<org.roora.domain.Product> result = org.roora.domain.Product.findProductEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Product' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Product' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProductIntegrationTest.testFlush() {
        org.roora.domain.Product obj = dod.getRandomProduct();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = org.roora.domain.Product.findProduct(id);
        org.junit.Assert.assertNotNull("Find method for 'Product' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProduct(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Product' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProductIntegrationTest.testMerge() {
        org.roora.domain.Product obj = dod.getRandomProduct();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = org.roora.domain.Product.findProduct(id);
        boolean modified =  dod.modifyProduct(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.roora.domain.Product merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Product' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProductIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        org.roora.domain.Product obj = dod.getNewTransientProduct(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Product' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Product' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProductIntegrationTest.testRemove() {
        org.roora.domain.Product obj = dod.getRandomProduct();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = org.roora.domain.Product.findProduct(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Product' with identifier '" + id + "'", org.roora.domain.Product.findProduct(id));
    }
    
}
