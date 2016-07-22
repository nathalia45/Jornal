package br.ufc.web.jornal.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Role;
import br.ufc.web.jornal.model.User;

@Repository
@Transactional
public class EditorDAO {

	@PersistenceContext
	private EntityManager manager;
	
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

	public void addJournalist(User user) {
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		manager.persist(user);
		List<Role> roles = new ArrayList<>();
		roles.add(new Role("ROLE_JOURNALIST"));
		manager.persist(roles.get(0));
		user.setRoles(roles);
		manager.persist(user);
	}
	
}
