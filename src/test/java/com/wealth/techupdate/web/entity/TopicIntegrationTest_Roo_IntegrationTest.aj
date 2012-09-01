// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.wealth.techupdate.web.entity;

import com.wealth.techupdate.web.entity.TopicDataOnDemand;
import com.wealth.techupdate.web.entity.TopicIntegrationTest;
import com.wealth.techupdate.web.repository.TopicRepository;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect TopicIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TopicIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TopicIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private TopicDataOnDemand TopicIntegrationTest.dod;
    
    @Autowired
    TopicRepository TopicIntegrationTest.topicRepository;
    
    @Test
    public void TopicIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", dod.getRandomTopic());
        long count = topicRepository.count();
        Assert.assertTrue("Counter for 'Topic' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TopicIntegrationTest.testFind() {
        Topic obj = dod.getRandomTopic();
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topic' failed to provide an identifier", id);
        obj = topicRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Topic' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Topic' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TopicIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", dod.getRandomTopic());
        long count = topicRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Topic', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Topic> result = topicRepository.findAll();
        Assert.assertNotNull("Find all method for 'Topic' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Topic' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TopicIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", dod.getRandomTopic());
        long count = topicRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Topic> result = topicRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Topic' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Topic' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TopicIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", dod.getRandomTopic());
        Topic obj = dod.getNewTransientTopic(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Topic' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Topic' identifier to be null", obj.getId());
        topicRepository.save(obj);
        Assert.assertNotNull("Expected 'Topic' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TopicIntegrationTest.testDelete() {
        Topic obj = dod.getRandomTopic();
        Assert.assertNotNull("Data on demand for 'Topic' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Topic' failed to provide an identifier", id);
        obj = topicRepository.findOne(id);
        topicRepository.delete(obj);
        Assert.assertNull("Failed to remove 'Topic' with identifier '" + id + "'", topicRepository.findOne(id));
    }
    
}
