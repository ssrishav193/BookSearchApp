package com.rishav.hibernate;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

public class HbUtility {
	public static SessionFactory getSessionFactory() {
		Configuration cfg = new Configuration();
		Properties properties = new Properties();
		properties.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
		properties.put(Environment.URL, "jdbc:mysql://localhost:3306/bookdb");
		properties.put(Environment.USER, "root");
		properties.put(Environment.PASS, "22634330");
		properties.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		//properties.put(Environment.HBM2DDL_AUTO, "create");//Create new Tables for every time.
		properties.put(Environment.HBM2DDL_AUTO, "update");//Create new Tables if does not exist.
		properties.put(Environment.SHOW_SQL, true);
		properties.put(Environment.FORMAT_SQL, true);
		cfg.setProperties(properties);
		
		cfg.addAnnotatedClass(Book.class);
		cfg.addAnnotatedClass(Login.class);
		
		SessionFactory sessionFactory=cfg.buildSessionFactory();
		return sessionFactory;
	}
}
