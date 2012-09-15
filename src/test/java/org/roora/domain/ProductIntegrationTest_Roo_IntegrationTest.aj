// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.roora.domain;

import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import java.util.List;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.roora.domain.Product;
import org.roora.domain.ProductDataOnDemand;
import org.roora.domain.ProductIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProductIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProductIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProductIntegrationTest: @Transactional;
    
    @Autowired
    private ProductDataOnDemand ProductIntegrationTest.dod;
    
    private static final LocalServiceTestHelper ProductIntegrationTest.helper = new LocalServiceTestHelper(new com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig());
    
    @BeforeClass
    public static void ProductIntegrationTest.setUp() {
        helper.setUp();
    }
    
    @AfterClass
    public static void ProductIntegrationTest.tearDown() {
        helper.tearDown();
    }
    
    @Test
    public void ProductIntegrationTest.testCountProducts() {
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = Product.countProducts();
        Assert.assertTrue("Counter for 'Product' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProductIntegrationTest.testFindProduct() {
        Product obj = dod.getRandomProduct();
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = Product.findProduct(id);
        Assert.assertNotNull("Find method for 'Product' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Product' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProductIntegrationTest.testFindAllProducts() {
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = Product.countProducts();
        Assert.assertTrue("Too expensive to perform a find all test for 'Product', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Product> result = Product.findAllProducts();
        Assert.assertNotNull("Find all method for 'Product' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Product' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProductIntegrationTest.testFindProductEntries() {
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        long count = Product.countProducts();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Product> result = Product.findProductEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Product' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Product' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProductIntegrationTest.testFlush() {
        Product obj = dod.getRandomProduct();
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = Product.findProduct(id);
        Assert.assertNotNull("Find method for 'Product' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProduct(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Product' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProductIntegrationTest.testMergeUpdate() {
        Product obj = dod.getRandomProduct();
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = Product.findProduct(id);
        boolean modified =  dod.modifyProduct(obj);
        Integer currentVersion = obj.getVersion();
        Product merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Product' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProductIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", dod.getRandomProduct());
        Product obj = dod.getNewTransientProduct(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Product' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Product' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Product' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional(propagation = Propagation.SUPPORTS)
    public void ProductIntegrationTest.testRemove() {
        Product obj = dod.getRandomProduct();
        Assert.assertNotNull("Data on demand for 'Product' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Product' failed to provide an identifier", id);
        obj = Product.findProduct(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Product' with identifier '" + id + "'", Product.findProduct(id));
    }
    
}