package com.wealth.techupdate.web.social;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.web.context.request.NativeWebRequest;

import com.wealth.techupdate.web.SessionKey;

public class SignInAdapterImpl implements SignInAdapter {

	@Override
	public String signIn(String userId, Connection<?> connection, NativeWebRequest request) {
		HttpServletRequest nativeRequest = request.getNativeRequest(HttpServletRequest.class);
		HttpSession session = nativeRequest.getSession();
		session.setAttribute(SessionKey.USER_ID, userId);
		session.setAttribute(SessionKey.CONNECTION, connection);
		return null;
	}
}
