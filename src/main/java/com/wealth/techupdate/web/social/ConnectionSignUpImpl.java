package com.wealth.techupdate.web.social;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;

import com.wealth.techupdate.web.entity.jpa.UserAccount;

public class ConnectionSignUpImpl implements ConnectionSignUp {

	@Override
	public String execute(Connection<?> connection) {
		UserAccount acc = new UserAccount();
		acc.persist();
		return acc.getId().toString();
	}

}
