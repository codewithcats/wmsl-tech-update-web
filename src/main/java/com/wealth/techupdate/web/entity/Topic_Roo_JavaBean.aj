// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.wealth.techupdate.web.entity;

import com.wealth.techupdate.web.entity.Speaker;
import com.wealth.techupdate.web.entity.Topic;
import java.util.Date;
import java.util.List;

privileged aspect Topic_Roo_JavaBean {
    
    public String Topic.getTitle() {
        return this.title;
    }
    
    public void Topic.setTitle(String title) {
        this.title = title;
    }
    
    public String Topic.getDescription() {
        return this.description;
    }
    
    public void Topic.setDescription(String description) {
        this.description = description;
    }
    
    public Date Topic.getSpeakDate() {
        return this.speakDate;
    }
    
    public void Topic.setSpeakDate(Date speakDate) {
        this.speakDate = speakDate;
    }
    
    public List<Speaker> Topic.getSpeakers() {
        return this.speakers;
    }
    
    public void Topic.setSpeakers(List<Speaker> speakers) {
        this.speakers = speakers;
    }
    
}
