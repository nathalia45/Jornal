package br.ufc.web.jornal.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.web.jornal.dao.ClassifiedDAO;
import br.ufc.web.jornal.dao.EditorDAO;
import br.ufc.web.jornal.dao.NewsDAO;
import br.ufc.web.jornal.model.User;

@Controller
public class HomeController {
	
	@Autowired
	private NewsDAO newsDao;
	
	@Autowired
	private ClassifiedDAO classifiedDao;
	
	@Autowired
	private EditorDAO editorDao;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("home");
		model.addObject("news", newsDao.getAll());
		model.addObject("classifieds", classifiedDao.getAll());
		return model;
	}
	
	@RequestMapping(value="/addUserForm")
	public ModelAndView addUserForm(User user) {
		return new ModelAndView("addUser");
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addUserForm(user);
		}
		
		editorDao.addUser(user);
		
		return new ModelAndView("redirect:/");
	}

}
