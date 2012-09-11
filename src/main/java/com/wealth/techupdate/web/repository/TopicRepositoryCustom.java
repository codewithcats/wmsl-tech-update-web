package com.wealth.techupdate.web.repository;

import java.util.List;

import com.wealth.techupdate.web.entity.Topic;

public interface TopicRepositoryCustom {
	List<Topic> findAllOrderBySessionDate();
}
