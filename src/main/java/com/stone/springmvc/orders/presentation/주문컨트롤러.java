package com.stone.springmvc.orders.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.orders.common.Orders;
import com.stone.springmvc.orders.service.I주문업무자;

@Controller
public class 주문컨트롤러 {
	@Autowired I주문업무자 주문업무자;
	
	//주문등록
	@PostMapping("/order")
	@ResponseBody 
	public String saveOrder(@RequestBody Orders newOrder, HttpSession session) {
		int loginMember = (int)session.getAttribute("회원번호");
		
		Member orderMember = new Member();
		orderMember.setNo(loginMember);
		newOrder.setMember(orderMember);
		주문업무자.saveOrdersService(newOrder);
		return "success";
	}
	
	//주문목록 조회
	@PostMapping("/orders")
	@ResponseBody 
	public List<Orders> readOrders(HttpSession session) {
		int loginMember = (int)session.getAttribute("회원번호");
		List<Orders> orderList = 주문업무자.selectOrderListService(loginMember);
		return orderList; 
	}
	
	//주문취소
	@GetMapping("/deleteOrder/{주문서번호}")
	@ResponseBody 
	public String 주문서를삭제하다(@PathVariable int 주문서번호) {
		System.out.println("주문서를삭제하다 =" + 주문서번호);
		주문업무자.deleteOrdersService(주문서번호);
		return "success";
	}

}
