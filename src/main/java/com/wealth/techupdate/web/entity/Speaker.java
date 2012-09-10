package com.wealth.techupdate.web.entity;

import flexjson.JSONSerializer;
import flexjson.transformer.StringTransformer;

import java.util.Collection;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
@RooJson
public class Speaker {

    private String name;

    private String profilePicPath;
    
    private String profile;


	public static String toJsonArray(Collection<Speaker> collection) {
        return new JSONSerializer()
        	.transform(new MongoIdTransformer(), "id")
        	.exclude("*.class").serialize(collection);
    }
}
