package com.wealth.techupdate.web;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import flexjson.JSONSerializer;

@Controller
public class UserController {

	@RequestMapping(method = RequestMethod.GET, value = "/user/profile/**")
	public ResponseEntity<String> getUserInfo(HttpSession session) {
		Connection<?> connection = (Connection<?>)session.getAttribute(SessionKey.CONNECTION);
		if (connection == null) {
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		UserProfile profile = connection.fetchUserProfile();
		String json = new JSONSerializer().serialize(profile);
		return new ResponseEntity<String>(json, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/user/connection/**")
	public ResponseEntity<String> getUserPofilePictureURL(HttpSession session) {
		Connection<?> connection = (Connection<?>)session.getAttribute(SessionKey.CONNECTION);
		if (connection == null) {
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		String json = new JSONSerializer().serialize(connection);
		return new ResponseEntity<String>(json, HttpStatus.OK);
	}
}
