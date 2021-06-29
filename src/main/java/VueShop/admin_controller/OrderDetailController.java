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

import VueShop.dao.OrderDetailDAO;
import VueShop.entity.OrderDetail;
import VueShop.service.CookieService;
import VueShop.service.ParamService;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;
import VueShop.service.OrderDetailService;

@Controller
@RequestMapping("indexAD")
public class OrderDetailController {
	
	
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
		OrderDetailDAO OrderDetailDAO;
		@Autowired
		OrderDetailService OrderDetailService;

	
	@GetMapping("OrderDetail")
	public String showlogin(Model model, @RequestParam("show") Optional<Integer> show) {
		OrderDetail item = new OrderDetail();
		model.addAttribute("item", item);
		List<OrderDetail> items = OrderDetailDAO.findAll();
		model.addAttribute("items", items);
		List<OrderDetail> ls = OrderDetailService.findAll();
		model.addAttribute("list_product", ls);	
		PageRequest pageable = PageRequest.of(show.orElse(0),2);
		Page<OrderDetail> page = OrderDetailService.findAll(pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyChiTietDonHangAD"; //3. view trang login lên
	}
	
	@PostMapping("OrderDetail")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("show") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords", ""));
		sessionService.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<OrderDetail> page = OrderDetailDAO.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyChiTietDonHangAD";
	}


	// hàm 5
	@RequestMapping("/deleteOrderDetail/{id}")
	public String delete(@PathVariable("id") Long id) {
		OrderDetailDAO.deleteById(id);
		return "redirect:/indexAD/OrderDetail";
	}
}
