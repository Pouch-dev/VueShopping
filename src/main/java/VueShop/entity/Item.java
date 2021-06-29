package VueShop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	//1. khai báo dữ liệu của món hàng
	Integer id;
	String name;
	String image1;
	double price;
	double sale;
	int qty = 1; 
}