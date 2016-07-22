package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.ufc.web.jornal.model.User;

@Repository
public class UserDAO implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		List<User> users = manager.createQuery("select u from User u where u.email = :email", User.class)
		.setParameter("email", email)
		.getResultList();
		
		if(users.isEmpty()) {
			throw new RuntimeException("User with email " + email + " not found!");
		}
		
		return users.get(0);
		
	}

	public List<User> getByRole(String role) {
		return manager.createQuery("select distinct(u) from User u join fetch u.roles r where r.name = :role", User.class)
				.setParameter("role", role).getResultList();
	}
	
	public User getById(int id) {
		return manager.createQuery("select u from User n where u.id=:id", User.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public void delete(User user) {
		manager.remove(user);
	}

	public void add(User user) {
		manager.persist(user);		
	}
	
}
