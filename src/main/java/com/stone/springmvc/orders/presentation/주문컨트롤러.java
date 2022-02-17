package com.stone.springmvc.orders.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.orders.common.Orders;
import com.stone.springmvc.orders.service.I주문업무자;

@Controller
public class 주문컨트롤러 {
	@Autowired I주문업무자 주문업무자;
	
	@PostMapping("/order")
	public String saveOrder(Orders newOrder, HttpSession session) {
		int loginMember = (int)session.getAttribute("회원번호");
		System.out.println("loginMember = " + loginMember);
		System.out.println("주문컨트롤러:::name = " + newOrder.getName());
		Member orderMember = new Member();
		orderMember.setNo(loginMember);
		newOrder.setMember(orderMember);
		
		주문업무자.saveOrdersService(newOrder);
		return "redirect:/main";
	}
	
	//주문정보 조회 (비동기 요청)
	@PostMapping("/orders")
	@ResponseBody 
	public List<Orders> readOrders() {
		List<Orders> orderList = 주문업무자.selectOrderListService();
		return orderList; 
	}

}
