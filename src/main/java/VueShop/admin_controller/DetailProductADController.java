package VueShop.admin_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import VueShop.dao.ProductDAO;
import VueShop.entity.Product;
import VueShop.service.CookieService;
import VueShop.service.ParamService;
import VueShop.service.ProductService;
import VueShop.service.SessionService;
import VueShop.service.ShoppingCartService;
import VueShop.service.AccountService;

@Controller
@RequestMapping("indexAD")
public class DetailProductADController {
	
	//1. tiêm vào 
		@Autowired
		CookieService cookieService;
		@Autowired
		ParamService paramService;
		@Autowired
		SessionService sessionService;
		@Autowired
		ProductService productService;
		@Autowired
		ShoppingCartService shoppingCartService;
		@Autowired
		AccountService userService;
		@Autowired
		ProductDAO productDAO;
	
	@GetMapping("DetailProduct")
	public String showlogin(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = productDAO.findAll();
		model.addAttribute("items", items);
		return "/Admin/QuanLyChiTietSanPhamAD"; 
	}
	
	// hàm 3
		@RequestMapping("/createProductDetail")
		public String create(Product item) {
			productDAO.save(item);
			return "redirect:/indexAD/home";
		}

		// hàm 4
		@RequestMapping("/updateProductDetail")
		public String update(Product item) {
			productDAO.save(item);
			return "redirect:/indexAD/editProductDetail/" + item.getId();
		}

		// hàm 5
		@RequestMapping("/deleteProductDetail/{id}")
		public String delete(@PathVariable("id") Integer id) {
			productDAO.deleteById(id);
			return "redirect:/indexAD/home";
		}
}
