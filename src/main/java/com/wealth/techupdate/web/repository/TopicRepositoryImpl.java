package com.wealth.techupdate.web.repository;

import java.util.List;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Order;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Sort;

import org.springframework.beans.factory.annotation.Autowired;

import com.wealth.techupdate.web.entity.Topic;

public class TopicRepositoryImpl implements TopicRepositoryCustom {
	
	@Autowired private MongoTemplate mongoTemplate;

	@Override
	public List<Topic> findAllOrderBySessionDate() {
		Query q = new Query();
		Sort sort = q.sort();
		sort.on("sessionDate", Order.ASCENDING);
		List<Topic> topics = mongoTemplate.find(q, Topic.class);
		return topics;
	}

}
