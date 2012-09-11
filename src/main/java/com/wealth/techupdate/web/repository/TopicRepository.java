package com.wealth.techupdate.web.repository;

import com.wealth.techupdate.web.entity.Topic;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Topic.class)
public interface TopicRepository extends TopicRepositoryCustom {

    List<com.wealth.techupdate.web.entity.Topic> findAll();

}
