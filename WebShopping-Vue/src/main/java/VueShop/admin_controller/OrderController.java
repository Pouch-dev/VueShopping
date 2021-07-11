package VueShop.admin_controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import VueShop.dao.OrderDAO;
import VueShop.entity.Order;
import VueShop.service.CookieService;
import VueShop.service.ParamService;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;
import VueShop.service.OrderService;

@Controller
@RequestMapping("indexAD")
public class OrderController {
	
	
	//1. tiêm vào 
		@Autowired
		CookieService cookieService;
		@Autowired
		ParamService paramService;
		@Autowired
		SessionService sessionService;
		@Autowired
		ShoppingCartService shoppingCartService;	
		@Autowired
		OrderDAO OrderDAO;
		@Autowired
		OrderService OrderService;

	
	@GetMapping("Order")
	public String showlogin(Model model, @RequestParam("show") Optional<Integer> show) {
		Order item = new Order();
		model.addAttribute("item", item);
		List<Order> items = OrderDAO.findAll();
		model.addAttribute("items", items);
		List<Order> ls = OrderService.findAll();
		model.addAttribute("list_product", ls);	
		PageRequest pageable = PageRequest.of(show.orElse(0),2);
		Page<Order> page = OrderService.findAll(pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyDonHangAD"; //3. view trang login lên
	}
	
	@PostMapping("Order")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("show") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords", ""));
		sessionService.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<Order> page = OrderDAO.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyDonHangAD";
	}


	// hàm 5
	@RequestMapping("/deleteOrder/{id}")
	public String delete(@PathVariable("id") Long id) {
		OrderDAO.deleteById(id);
		return "redirect:/indexAD/Order";
	}
}
