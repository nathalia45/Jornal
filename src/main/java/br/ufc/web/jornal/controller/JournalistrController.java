package br.ufc.web.jornal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.web.jornal.dao.NewsDAO;

@Controller
@RequestMapping("/journalist")
public class JournalistrController {
	
	@Autowired
	private NewsDAO newsDao;
	
	@RequestMapping("")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("journalist/home");
		model.addObject("news", newsDao.getAll());
		return model;
	}

}
