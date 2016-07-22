package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Role;

@Repository
@Transactional
public class RoleDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public void add(Role Role) {
		manager.persist(Role);
	}
	
	public void update(Role Role) {
		manager.merge(Role);
	}
	
	public void delete(Role Role) {
		manager.remove( (manager.contains(Role)? Role: manager.merge(Role)) );
	}

	public List<Role> getAll() {
		return manager.createQuery("select n from Role n", Role.class).getResultList();
	}
	
	public Role getByName(String name) {
		return manager.createQuery("select n from Role n where n.name=:name", Role.class)
				.setParameter("name", name)
				.getSingleResult();
	}
	
}
