package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Classified;
import br.ufc.web.jornal.model.User;

@Repository
@Transactional
public class ClassifiedDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public void add(Classified classified) {
		manager.persist(classified);
	}
	
	public void update(Classified classified) {
		manager.merge(classified);
	}
	
	public void delete(Classified classified) {
		manager.remove( (manager.contains(classified)? classified: manager.merge(classified)) );
	}

	public List<Classified> getAll() {
		return manager.createQuery("select n from Classified n", Classified.class).getResultList();
	}
	
	public Classified getById(int id) {
		return manager.createQuery("select n from Classified n where n.id=:id", Classified.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public List<Classified> getByAuthor(User user) {
		return manager.createQuery("select n from Classified n where n.author.id=:id", Classified.class)
				.setParameter("id", user.getId())
				.getResultList();
	}
	
}
