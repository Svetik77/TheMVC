package net.proselyte.usermanager.service;

import net.proselyte.usermanager.dao.UserDao;
import net.proselyte.usermanager.model.Users;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(Users user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(Users user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public Users getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<Users> listUsers() {
        return this.userDao.listUsers();
    }

	@Override
	   @Transactional  
	public List<Users> listUsersPages(int pageid, int total) {
		return this.userDao.listUsersPages(pageid, total);
	}

	@Override
	@Transactional 
	public List<Users> getUserByName(String name) {
		 return this.userDao.getUserByName(name);
	}

    
    
    
}
