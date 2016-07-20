package br.ufc.web.jornal.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.web.jornal.dao.ProductDAO;
import br.ufc.web.jornal.infra.FileSaver;
import br.ufc.web.jornal.model.MessageSet;
import br.ufc.web.jornal.model.Price;
import br.ufc.web.jornal.model.Product;
import br.ufc.web.jornal.validation.ProductValidation;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDAO productDao;
	
	@Autowired
	private FileSaver fileSaver;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
	    binder.addValidators(new ProductValidation());
	}
	
	@RequestMapping("addForm")
	public ModelAndView addForm(Product product) {
		ModelAndView modelAndView = new ModelAndView("product/addForm");
		modelAndView.addObject("types", Price.Type.values());
		return modelAndView;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public ModelAndView add(MultipartFile image, @Valid Product product, BindingResult result, RedirectAttributes redirectAttributes) {
				
		if(result.hasErrors()) {
			return addForm(product);
		}
		
		String path = fileSaver.write("uploads", image);
		product.setImagePath(path);
		productDao.add(product);
				
		redirectAttributes.addFlashAttribute("messages", 
				new MessageSet().addMessageSuccess("Produto adicionado!").getMessages()
		);
		
		return new ModelAndView("redirect:/product/list");
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("product/list");
		modelAndView.addObject("products", productDao.list());
		return modelAndView;
	}
	
}
