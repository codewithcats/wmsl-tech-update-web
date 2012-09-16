package com.wealth.techupdate.web.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;

import com.wealth.techupdate.web.social.ConnectionSignUpImpl;

@Configuration
public class SocialConfig {

	@Autowired
	private DataSource dataSource;

	@Bean
	public ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
		registry.addConnectionFactory(new FacebookConnectionFactory("342701195821722", "f8bb9d5c0ba13f2a7c7a5bcd10cce3f6"));
		return registry;
	}

	@Bean
	public UsersConnectionRepository usersConnectionRepository() {
		JdbcUsersConnectionRepository repo = new JdbcUsersConnectionRepository(dataSource, connectionFactoryLocator(), Encryptors.noOpText());
		repo.setConnectionSignUp(new ConnectionSignUpImpl());
		return repo;
	}

}
