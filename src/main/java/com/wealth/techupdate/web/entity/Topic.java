package com.wealth.techupdate.web.entity;

import flexjson.JSONSerializer;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
@RooJson
public class Topic {
	private String title;
	private String description;
	@DBRef
	private List<Speaker> speakers;
	@Indexed(direction = IndexDirection.ASCENDING)
	private Date sessionDate;

	public static String toJsonArray(Collection<Topic> collection) {
        return new JSONSerializer().exclude("*.class")
        		.include("speakers")
        		.serialize(collection);
    }
}
