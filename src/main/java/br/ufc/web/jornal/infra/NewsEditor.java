package br.ufc.web.jornal.infra;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.ufc.web.jornal.dao.NewsDAO;

@Component
public class NewsEditor extends PropertyEditorSupport {

	@Autowired
	NewsDAO newsDao;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		this.setValue(newsDao.getById(Integer.valueOf(text)));
	}
	
}
