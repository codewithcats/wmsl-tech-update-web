// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.wealth.techupdate.web.entity;

import com.wealth.techupdate.web.entity.Speaker;
import com.wealth.techupdate.web.entity.Topic;
import com.wealth.techupdate.web.entity.TopicDataOnDemand;
import com.wealth.techupdate.web.repository.TopicRepository;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TopicDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TopicDataOnDemand: @Component;
    
    private Random TopicDataOnDemand.rnd = new SecureRandom();
    
    private List<Topic> TopicDataOnDemand.data;
    
    @Autowired
    TopicRepository TopicDataOnDemand.topicRepository;
    
    public Topic TopicDataOnDemand.getNewTransientTopic(int index) {
        Topic obj = new Topic();
        setDescription(obj, index);
        setSpeakDate(obj, index);
        setSpeaker(obj, index);
        setTitle(obj, index);
        return obj;
    }
    
    public void TopicDataOnDemand.setDescription(Topic obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void TopicDataOnDemand.setSpeakDate(Topic obj, int index) {
        Date speakDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setSpeakDate(speakDate);
    }
    
    public void TopicDataOnDemand.setSpeaker(Topic obj, int index) {
        Speaker speaker = null;
        obj.setSpeaker(speaker);
    }
    
    public void TopicDataOnDemand.setTitle(Topic obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public Topic TopicDataOnDemand.getSpecificTopic(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Topic obj = data.get(index);
        BigInteger id = obj.getId();
        return topicRepository.findOne(id);
    }
    
    public Topic TopicDataOnDemand.getRandomTopic() {
        init();
        Topic obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return topicRepository.findOne(id);
    }
    
    public boolean TopicDataOnDemand.modifyTopic(Topic obj) {
        return false;
    }
    
    public void TopicDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = topicRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Topic' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Topic>();
        for (int i = 0; i < 10; i++) {
            Topic obj = getNewTransientTopic(i);
            try {
                topicRepository.save(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}
