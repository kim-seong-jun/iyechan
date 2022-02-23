package com.stone.springmvc.orders.dataservice;

import java.util.List;

import com.stone.springmvc.orders.common.Orders;

public interface I주문DAO {
	public void saveOrders(Orders newOrder);
	public List<Orders> selectOrderList(int loginMember);
	public Orders selectByNo(int orderNo);
	public void updateOrders(Orders orders);
	public void deleteOrders(int orderNo);
}
