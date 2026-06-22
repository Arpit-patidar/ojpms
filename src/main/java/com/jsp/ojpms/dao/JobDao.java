package com.jsp.ojpms.dao;

import java.util.Base64;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static void saveJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(job);
		et.commit();
	}

	public static List<Job> getAllJobs() {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job");
		List<Job> list = query.getResultList();
		return list;
	}

	public static List<Job> getAllJob(String search) {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j WHERE j.title LIKE ?1 OR j.description LIKE ?1 OR j.location LIKE ?1");

		query.setParameter(1, "%" + search + "%");

		return query.getResultList();
	}

	public static List<Job> getAllJobsSortedByLatest() {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j ORDER BY j.id DESC");

		return query.getResultList();
	}

	public static List<Job> getAllJobsSortedBySalary() {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j ORDER BY j.salary DESC");

		return query.getResultList();
	}

	public static List<Job> getAllJobsSortedByMostApplied() {

	    EntityManager em = JPAUtil.getEm();

	    Query query = em.createQuery(
	        "SELECT j FROM Job j ORDER BY " +
	        "(SELECT COUNT(a.id) FROM Application a WHERE a.job = j) DESC"
	    );

	    return query.getResultList();
	}
}
