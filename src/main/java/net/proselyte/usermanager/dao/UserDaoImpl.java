package net.proselyte.usermanager.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import net.proselyte.usermanager.model.Users;

@Repository
public class UserDaoImpl implements UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addUser(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(user);
		logger.info("user successfully saved. user details: " + user);
	}

	@Override
	public void updateUser(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(user);
		logger.info("user successfully update. user details: " + user);
	}

	@Override
	public void removeUser(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Users user = (Users) session.load(Users.class, new Integer(id));

		if (user != null) {
			session.delete(user);
		}
		logger.info("user successfully removed. user details: " + user);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Users> listUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Users> userList = session.createQuery("from Users" ).list();

		for (Users user : userList) {
			logger.info("user list: " + user);
		}

		return userList;
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Users> listUsersPages(int start, int total) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("FROM Users");
		q.setFirstResult(start-1);
		q.setMaxResults(total);
		List<Users> userListPage = q.list();

		for (Users user : userListPage) {
			logger.info("user list: " + user);
		}
		return userListPage;
	}
	
	@Override
	public Users getUserById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Users user = (Users) session.load(Users.class, new Integer(id));
		logger.info("user successfully loaded. user details: " + user);
		return user;
	}

	@Override
	public List<Users>  getUserByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT E.name FROM Users E";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Users> userList = query.list();
		
		/*ClassCastException: java.lang.String cannot be cast to net.proselyte.usermanager.model.Users*/
//		for (Users user : userList) {  // TODO exp
//			logger.info("user list: " + user);
//		}
		

		return userList;
	}

}
