package br.ufc.web.jornal.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.web.jornal.dao.NewsDAO;
import br.ufc.web.jornal.dao.SectionDAO;
import br.ufc.web.jornal.infra.NewsEditor;
import br.ufc.web.jornal.infra.SectionEditor;
import br.ufc.web.jornal.model.MessageSet;
import br.ufc.web.jornal.model.News;
import br.ufc.web.jornal.model.Section;
import br.ufc.web.jornal.model.User;

@Controller
@RequestMapping("/news")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class NewsController {
	
	@Autowired
	private NewsDAO newsDao;
	
	@Autowired
	private SectionDAO sectionDao;
	
	@Autowired
	MessageSet messageSet;
	
	private @Autowired SectionEditor sectionEditor;
	private @Autowired NewsEditor newsEditor;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Section.class, this.sectionEditor);
        binder.registerCustomEditor(News.class, this.newsEditor);
    }
    
	@RequestMapping(value="addForm")
	public ModelAndView addForm(News news) {
		ModelAndView modelAndView = new ModelAndView("news/add");
		modelAndView.addObject("sections", sectionDao.getAll());
		return modelAndView;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public ModelAndView add(@Valid News news, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addForm(news);
		}
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		news.setAuthor(user);
		newsDao.add(news);
		
		redirectAttributes.addFlashAttribute("messages", 
				messageSet.addMessageSuccess("Notícia adicionada!").getMessages()
		);
		
		return new ModelAndView("redirect:/journalist");
	}
	
	@RequestMapping(value="editForm/{id}")
	public ModelAndView editForm(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("news/edit");
		modelAndView.addObject("news", newsDao.getById(id));
		modelAndView.addObject("sections", sectionDao.getAll());
		return modelAndView;
	}
	
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public ModelAndView edit(@Valid News news, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return editForm(news.getId());
		}
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		news.setAuthor(user);
		System.out.println(news.getSection().getName() + " : " + user.getName());
		newsDao.update(news);
		
		redirectAttributes.addFlashAttribute("messages", 
				messageSet.addMessageSuccess("Notícia adicionada!").getMessages()
		);
		
		return new ModelAndView("redirect:/journalist");
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("news/list");
		modelAndView.addObject("news", newsDao.getAll());
		return modelAndView;
	}
	
	@RequestMapping(value="see/{id}", method=RequestMethod.GET)
	public ModelAndView see(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("news/see");
		modelAndView.addObject("news", newsDao.getById(id));
		return modelAndView;
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable int id) {
		newsDao.delete(newsDao.getById(id));
		return new ModelAndView("redirect:/journalist");
	}
	
	@RequestMapping(value="listSections", method=RequestMethod.GET)
	public ModelAndView listSections() {
		ModelAndView modelAndView = new ModelAndView("news/listSections");
		modelAndView.addObject("sections", sectionDao.getAll());
		return modelAndView;
	}
	
	@RequestMapping(value="listBySection/{id}", method=RequestMethod.GET)
	public ModelAndView listBySection(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("news/listBySection");
		Section section = sectionDao.getById(id);
		modelAndView.addObject("section", section);
		modelAndView.addObject("news", newsDao.getBySection(section));
		return modelAndView;
	}
	
}
