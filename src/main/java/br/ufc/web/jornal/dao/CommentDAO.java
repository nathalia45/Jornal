package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Comment;
import br.ufc.web.jornal.model.News;

@Repository
@Transactional
public class CommentDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public void add(Comment comment) {
		manager.persist(comment);
	}
	
	public void update(Comment comment) {
		manager.merge(comment);
	}
	
	public void delete(Comment comment) {
		manager.remove( (manager.contains(comment)? comment: manager.merge(comment)) );
	}

	public List<Comment> getAll() {
		return manager.createQuery("select n from Comment n", Comment.class).getResultList();
	}
	
	public Comment getById(int id) {
		return manager.createQuery("select n from Comment n where n.id=:id", Comment.class)
				.setParameter("id", id)
				.getSingleResult();
	}
	
	public List<Comment> getByNews(News news) {
		return manager.createQuery("select n from Comment n where n.news.id=:id", Comment.class)
				.setParameter("id", news.getId())
				.getResultList();
	}
	
}
