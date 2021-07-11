package VueShop.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import VueShop.entity.Account;
import VueShop.service.AccountService;
import VueShop.service.CookieService;
import VueShop.service.ParamService;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;

@Controller
@RequestMapping("index")
public class LoginController {

	//1. tiêm vào 
		@Autowired
		CookieService cookieService;
		@Autowired
		ParamService paramService;
		@Autowired
		SessionService sessionService;
		@Autowired
		ShoppingCartService cart;
		@Autowired
		AccountService accountService;
		
		@GetMapping("login")
		public String showlogin(Model model) {
			model.addAttribute("cart", cart);
			model.addAttribute("getcount", cart.getCount());
			model.addAttribute("getamount", cart.getAmount());
			model.addAttribute("getsale", cart.getAmountSale());
			return "/login/login";
		}
		
		@PostMapping("login")
		public String checklogin(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
			boolean remember = paramService.getBoolean("remember", false);
			
			Account role = accountService.findById(username).orElse(null);
			//boolean role;
			if(accountService.checkLogin(username, password)) {
						
						sessionService.set("username", username);
						if(remember)
						{
							cookieService.add("user", username, 10);
							cookieService.add("pass", password, 10);
							System.out.println("luu cookie ok");
						}
						else
						{
							cookieService.remove("user");
							cookieService.remove("pass");
						}
						if(role.isAdmin()) {
							System.out.println("Hello Admin!!");
							return "redirect:/indexAD/home";
						}else {
							System.out.println("Login successfull!!");
							return "redirect:/home/index";
						}
			}else {
				System.out.println("Login fails!");
				model.addAttribute("erorr", "Username or Password valile");
			}
			
			return "/login/login";
		}
		
		@GetMapping("logout")
		public String logout() {
			sessionService.remove("username");
			return "redirect:/home/index";
		}
	}