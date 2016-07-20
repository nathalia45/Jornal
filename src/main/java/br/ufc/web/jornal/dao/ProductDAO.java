package br.ufc.web.jornal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.ufc.web.jornal.model.Product;

@Repository
@Transactional
public class ProductDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public boolean add(Product product) {
		manager.persist(product);
		return true;
	}

	public List<Product> list() {
		return manager.createQuery("select p from Product p", Product.class).getResultList();
	}

}
