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

import VueShop.dao.AccountDAO;
import VueShop.entity.Account;
import VueShop.service.CookieService;
import VueShop.service.ParamService;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;
import VueShop.service.AccountService;

@Controller
@RequestMapping("indexAD")
public class UserController {
	
	
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
		AccountDAO AccountDAO;
		@Autowired
		AccountService AccountService;

	
	@GetMapping("Account")
	public String showlogin(Model model, @RequestParam("show") Optional<Integer> show) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = AccountDAO.findAll();
		model.addAttribute("items", items);
		List<Account> ls = AccountService.findAll();
		model.addAttribute("list_product", ls);	
		PageRequest pageable = PageRequest.of(show.orElse(0),2);
		Page<Account> page = AccountService.findAll(pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyNguoiDungAD"; //3. view trang login lên
	}
	
	@PostMapping("Account")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("show") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords", ""));
		sessionService.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<Account> page = AccountDAO.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("list_product", page);
		return "/Admin/QuanLyNguoiDungAD";
	}

	// hàm 3
	@RequestMapping("/createAccount")
	public String create(Account item) {
		AccountDAO.save(item);
		return "redirect:/indexAD/Account";
	}

	// hàm 4
	@RequestMapping("/updateAccount")
	public String update(Account item) {
		AccountDAO.save(item);
		return "redirect:/indexAD/editAccount/" + item.getUsername();
	}

	// hàm 5
	@RequestMapping("/deleteAccount/{id}")
	public String delete(@PathVariable("id") String id) {
		AccountDAO.deleteById(id);
		return "redirect:/indexAD/Account";
	}
	
	
	@GetMapping("editAccount/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account item = AccountDAO.findById(username).get();
		model.addAttribute("item", item);
		List<Account> items = AccountDAO.findAll();
		model.addAttribute("items", items);
		return "/Admin/QuanLyNguoiDungAD";
	}
}
