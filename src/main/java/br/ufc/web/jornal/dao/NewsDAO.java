package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.News;
import br.ufc.web.jornal.model.Section;

@Repository
@Transactional
public class NewsDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public void add(News news) {
		manager.persist(news);
	}
	
	public void update(News news) {
		manager.merge(news);
	}
	
	public void delete(News news) {
		manager.remove( (manager.contains(news)? news: manager.merge(news)) );
	}

	public List<News> getAll() {
		return manager.createQuery("select n from News n", News.class).getResultList();
	}
	
	public News getById(int id) {
		return manager.createQuery("select n from News n where n.id=:id", News.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public List<News> getBySection(Section section) {
		return manager.createQuery("select n from News n where n.section.id=:id", News.class)
				.setParameter("id", section.getId())
				.getResultList();
	}
	
}
