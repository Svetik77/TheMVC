package net.proselyte.usermanager.dao;

import java.util.List;

import net.proselyte.usermanager.model.Users;

public interface UserDao {
    public void addUser(Users user);

    public void updateUser(Users user);

    public void removeUser(int id);

    public Users getUserById(int id);

    public List<Users> listUsers();
    
	public List<Users> listUsersPages(int pageid, int total);

	public List<Users>  getUserByName(String name);
	
}
