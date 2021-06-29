package VueShop.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import VueShop.dao.ProductDAO;
import VueShop.entity.Product;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	ShoppingCartService cart;

	@RequestMapping("/product/shop")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("cart", cart);
		model.addAttribute("getcount", cart.getCount());
		model.addAttribute("getamount", cart.getAmount());
		model.addAttribute("getsale", cart.getAmountSale());
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = dao.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("page", page);
		Page<Product> pagesaleASC = dao.findAllBySaleASC(pageable);
		model.addAttribute("saleASC", pagesaleASC);
		Page<Product> pagesaleDESC = dao.findAllBySaleDESC(pageable);
		model.addAttribute("saleDESC", pagesaleDESC);
		return "product/shop-full";
	}

}

