package net.proselyte.usermanager.service;

import java.util.List;

import net.proselyte.usermanager.model.Users;

public interface UserService {
    public void addUser(Users user);

    public void updateUser(Users user);

    public void removeUser(int id);

    public Users getUserById(int id);

    public List<Users> listUsers();

	public List<Users> listUsersPages(int pageid, int total);

    public List<Users> getUserByName(String name);

}
