package br.ufc.web.jornal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.web.jornal.dao.ClassifiedDAO;
import br.ufc.web.jornal.dao.NewsDAO;
import br.ufc.web.jornal.dao.SectionDAO;
import br.ufc.web.jornal.dao.UserDAO;
import br.ufc.web.jornal.model.Classified;
import br.ufc.web.jornal.model.Role;
import br.ufc.web.jornal.model.Section;
import br.ufc.web.jornal.model.User;

@Controller
@RequestMapping("/editor")
public class EditorController {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ClassifiedDAO classifiedDao;
	@Autowired
	private SectionDAO sectionDao;
	@Autowired
	private NewsDAO newsDao;
	
	@RequestMapping("")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("editor/home");
		model.addObject("journalists", userDao.getByRole("ROLE_JOURNALIST"));
		model.addObject("classifieds", classifiedDao.getAll());
		model.addObject("sections", sectionDao.getAll());
		model.addObject("news", newsDao.getAll());
		return model;
	}
	
	@RequestMapping(value="addJournalistForm")
	public ModelAndView addJournalistForm(User user) {
		return new ModelAndView("editor/addJournalist");
	}
	
	@RequestMapping(value="addJournalist", method=RequestMethod.POST)
	public ModelAndView addJournalist(@Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addJournalistForm(user);
		}
		
		List<Role> roles = new ArrayList<>();
		Role r = new Role();
		r.setName("ROLE_JOURNALIST");
		roles.add(r);
		user.setRoles(roles);
		userDao.add(user);
		
		return new ModelAndView("redirect:/editor");
	}
	
	@RequestMapping("deleteJournalist/{id}")
	public ModelAndView deleteJournalist(@PathVariable int id) {
		ModelAndView model = new ModelAndView("redirect:/editor");
		userDao.delete(userDao.getById(id));
		return model;
	}

	@RequestMapping(value="deleteNews/{id}", method=RequestMethod.GET)
	public ModelAndView deleteNews(@PathVariable int id) {
		newsDao.delete(newsDao.getById(id));
		return new ModelAndView("redirect:/editor");
	}
	
	@RequestMapping(value="addClassifiedForm")
	public ModelAndView addClassifiedForm(Classified classified) {
		return new ModelAndView("editor/addClassified");
	}
	
	@RequestMapping(value="addClassified", method=RequestMethod.POST)
	public ModelAndView addClasified(@Valid Classified classified, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addClassifiedForm(classified);
		}
		
		classifiedDao.add(classified);
		
		return new ModelAndView("redirect:/editor");
	}
	
	@RequestMapping(value="deleteClassified/{id}", method=RequestMethod.GET)
	public ModelAndView deleteClassified(@PathVariable int id) {
		classifiedDao.delete(classifiedDao.getById(id));
		return new ModelAndView("redirect:/editor");
	}
	
	@RequestMapping(value="addSectionForm")
	public ModelAndView addSectionForm(Section section) {
		return new ModelAndView("editor/addSection");
	}
	
	@RequestMapping(value="addSection", method=RequestMethod.POST)
	public ModelAndView addSection(@Valid Section section, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addSectionForm(section);
		}
		
		sectionDao.add(section);
		
		return new ModelAndView("redirect:/editor");
	}
	
	@RequestMapping(value="deleteSection/{id}", method=RequestMethod.GET)
	public ModelAndView deleteSection(@PathVariable int id) {
		sectionDao.delete(sectionDao.getById(id));
		return new ModelAndView("redirect:/editor");
	}
	
}
