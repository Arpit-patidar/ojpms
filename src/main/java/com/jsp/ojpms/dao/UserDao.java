package com.jsp.ojpms.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class UserDao {

	public static void save(User user) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(user);
		et.commit();

		System.out.println("User Saved : " + user);
	}

	public static boolean updatePassword(String email, String password) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();

		Query query = em.createQuery(
				"UPDATE User u SET u.password = :password WHERE u.email = :email");

		query.setParameter("email", email);
		query.setParameter("password", password);

		int rowsUpdated = query.executeUpdate();

		et.commit();

		em.clear();

		return rowsUpdated > 0;
	}

	public static User getUser(String email, String password) {

		try {

			EntityManager em = JPAUtil.getEm();

			Query query = em.createQuery(
					"FROM User WHERE email=?1 AND password=?2");

			query.setParameter(1, email);
			query.setParameter(2, password);

			User user = (User) query.getSingleResult();

			return user;

		} catch (Exception e) {

			e.printStackTrace();

			return null;
		}
	}

	public static void updateProfile(User userObj) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(userObj);
		et.commit();

		System.out.println("Profile Updated : " + userObj);
	}
}