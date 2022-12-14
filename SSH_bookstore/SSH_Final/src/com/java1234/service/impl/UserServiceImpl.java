package com.java1234.service.impl;

import java.util.List;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.BaseDao;
import com.java1234.entity.User;
import com.java1234.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private BaseDao<User> baseDao;
	
	@Override
	public void saveUser(User user) {
		baseDao.save(user);}
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		baseDao.update(user);
	}

	@Override
	public User findUserById(int id) {
		return baseDao.get(User.class, id);
	}

	@Override
	public void deleteUser(User user) {
		baseDao.delete(user);
	}

	@Override
	public List<User> findAllList() {
		return baseDao.find("from User");
	}

	@Override
	public User findUserBy2(User user) {
		return baseDao.get("from User u where u.user_name=? and u.password=?", new Object[]{user.getUser_name(),user.getPassword()});
	}
	public User findUserByPhone(User user)
	{		return baseDao.get("from User u where u.user_name=? and u.telephone=?", new Object[]{user.getUser_name(),user.getTelephone()});
}
	public User findUserByName(User user) 
	{		return baseDao.get("from User u where u.user_name=?", new Object[]{user.getUser_name()});
}

}
