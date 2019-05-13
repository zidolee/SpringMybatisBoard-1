package com.springbook.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	// setter 인젝션
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
		System.out.println("===> Setter 인젝션 처리");
	}

	@Override
	public int insetUserVO(UserVO vo) {
		int joinCheck = 0;
		joinCheck =  userDAO.insertUser(vo);
		return joinCheck;
	}

	@Override
	public UserVO getUserVO(UserVO vo) {
		return userDAO.getUser(vo);
	}





}
