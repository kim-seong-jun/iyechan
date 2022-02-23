package com.stone.springmvc.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.orders.common.Orders;
import com.stone.springmvc.orders.dataservice.I주문DAO;

@Service
public class 주문업무자 implements I주문업무자 {
	@Autowired I주문DAO 주문DAO;

	@Override
	public void saveOrdersService(Orders newOrder) {
		주문DAO.saveOrders(newOrder);
	}

	@Override
	public List<Orders> selectOrderListService(int loginMember) {
		return 주문DAO.selectOrderList(loginMember);
	}

	@Override
	public Orders selectByNoService(int orderNo) {
		return 주문DAO.selectByNo(orderNo);
	}

	@Override
	public void updateOrdersService(Orders orders) {
		주문DAO.updateOrders(orders);
	}

	@Override
	public void deleteOrdersService(int orderNo) {
		주문DAO.deleteOrders(orderNo);
	}
	


}
