package br.ufc.web.jornal.infra;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.ufc.web.jornal.dao.SectionDAO;

@Component
public class SectionEditor extends PropertyEditorSupport {

	@Autowired
	SectionDAO sectionDao;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		this.setValue(sectionDao.getById(Integer.valueOf(text)));
	}
	
}
