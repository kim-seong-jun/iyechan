package com.stone.springmvc.orders.service;

import java.util.List;

import com.stone.springmvc.orders.common.Orders;

public interface I주문업무자 {
	public void saveOrdersService(Orders newOrder);
	public List<Orders> selectOrderListService(int loginMember);
	public Orders selectByNoService(int orderNo);
	public void updateOrdersService(Orders orders);
	public void deleteOrdersService(int orderNo);
}
