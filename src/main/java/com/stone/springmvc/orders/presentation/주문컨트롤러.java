package com.stone.springmvc.orders.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.orders.common.Orders;
import com.stone.springmvc.orders.service.I주문업무자;

@Controller
public class 주문컨트롤러 {
	@Autowired I주문업무자 주문업무자;
	
	//주문등록
	@PostMapping("/order")
	public String saveOrder(Orders newOrder, HttpSession session) {
		int loginMember = (int)session.getAttribute("회원번호");
		
		Member orderMember = new Member();
		orderMember.setNo(loginMember);
		newOrder.setMember(orderMember);
		주문업무자.saveOrdersService(newOrder);
		return "redirect:/main";
	}
	
	//주문목록 조회 (비동기 요청)
	@PostMapping("/orders")
	@ResponseBody 
	public List<Orders> readOrders(HttpSession session) {
		int loginMember = (int)session.getAttribute("회원번호");
		System.out.println("loginMember= " + loginMember);
		List<Orders> orderList = 주문업무자.selectOrderListService(loginMember);
		return orderList; 
	}
	
	//주문서 변경준비
	@GetMapping("/updateOrder/{주문서번호}")
	public Orders 주문서변경준비하다(@PathVariable int 주문서번호){
		System.out.println("@GetMapping");
		Orders orders = 주문업무자.selectByNoService(주문서번호);
		return orders;
	}
	@PostMapping("/updateOrder/{주문서번호}")
	public Orders 주문서변경준비하다1(@PathVariable int 주문서번호){
		System.out.println("@PostMapping");
		Orders orders = 주문업무자.selectByNoService(주문서번호);
		return orders;
	}
	
	//주문서 변경
	@PostMapping("/updateOrder")
	public void 주문서를변경하다(Orders orders) {
		주문업무자.updateOrdersService(orders);
	}
	
	//주문서 삭제
	@GetMapping("/deleteOrder/{주문서번호}")
	public void 주문서를삭제하다(@PathVariable int 주문서번호) {
		주문업무자.deleteOrdersService(주문서번호);
	}
	

}
