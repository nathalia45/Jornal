package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Section;

@Repository
@Transactional
public class SectionDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public void add(Section section) {
		manager.persist(section);
	}
	
	public void update(Section section) {
		manager.merge(section);
	}
	
	public void delete(Section section) {
		manager.remove( (manager.contains(section)? section: manager.merge(section)) );
	}

	public List<Section> getAll() {
		return manager.createQuery("select n from Section n", Section.class).getResultList();
	}
	
	public Section getById(int id) {
		return manager.createQuery("select n from Section n where n.id=:id", Section.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public Section getBySection(Section section) {
		return manager.createQuery("select n from Section n where n.section_id=:id", Section.class)
				.setParameter("id", section.getId())
				.getSingleResult();
	}
	
}
