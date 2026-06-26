package com.jsp.ojpms.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

//We are using singleton design pattern  to create object of 
//EntityManager
//It will return object of EntityManager
public class JPAUtil {

	private static EntityManager em=null;
	
	private JPAUtil() {
		
	}
	public static EntityManager getEm() {
		if(em==null) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("jsp");
			em=emf.createEntityManager();
			return em;
			
		}else {
			return em;
		}
	}
}
