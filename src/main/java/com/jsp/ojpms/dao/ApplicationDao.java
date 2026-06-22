package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {

	public static void saveApplication(Application applObj) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(applObj);
		et.commit();

	}
	
	
	public static boolean isApplyAlready(int userId , int jobId) {
		
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2");
		
		query.setParameter(1, userId);
		query.setParameter(2, jobId);
		
		List resultList = query.getResultList();
		
		boolean empty = resultList.isEmpty();
		
		return !empty;
		
	}

}
