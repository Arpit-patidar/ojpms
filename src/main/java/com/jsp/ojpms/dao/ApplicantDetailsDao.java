package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.ApplicantDetails;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicantDetailsDao {

	public static void save(ApplicantDetails applicant) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(applicant);
		et.commit();
	}

	public static List<ApplicantDetails> getAllCandidates() {

		EntityManager em = JPAUtil.getEm();

		return em.createQuery("FROM ApplicantDetails", ApplicantDetails.class).getResultList();
	}

	public static List<ApplicantDetails> getCandidateByJob(int jobId) {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM ApplicantDetails WHERE jobId=?1");

		query.setParameter(1, jobId);

		return query.getResultList();
	}

	public static ApplicantDetails getById(int id) {

		EntityManager em = JPAUtil.getEm();

		return em.find(ApplicantDetails.class, id);
	}

	public static void updateStatus(int id, String status) {

		EntityManager em = JPAUtil.getEm();

		EntityTransaction et = em.getTransaction();

		ApplicantDetails app = em.find(ApplicantDetails.class, id);

		et.begin();

		app.setStatus(status);

		em.merge(app);

		et.commit();
	}
}