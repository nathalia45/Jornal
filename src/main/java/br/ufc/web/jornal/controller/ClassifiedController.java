package br.ufc.web.jornal.controller;

import java.math.BigDecimal;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.ufc.web.jornal.dao.ClassifiedDAO;
import br.ufc.web.jornal.model.Classified;

@Controller
@RequestMapping("/classified")
public class ClassifiedController {
	
	@Autowired
	private ClassifiedDAO classifiedDao;
	
	
	@RequestMapping(value="see/{id}")
	public ModelAndView see(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("classified/see");
		modelAndView.addObject("classified", classifiedDao.getById(id));
		return modelAndView;
	}
	
	@RequestMapping(value="addOffer/{id}")
	public ModelAndView addOffer(String bestOffer, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/classified/see/" + id);
		Classified classified = classifiedDao.getById(id);
		BigDecimal bd = new BigDecimal(bestOffer.replace(",", ""));
		if(classified.getBestOffer().compareTo(bd) == -1) {
			classified.setBestOffer(bd);
			classified.setBestOfferDate(Calendar.getInstance());
			classifiedDao.update(classified);
		}
		return modelAndView;
	}

}
