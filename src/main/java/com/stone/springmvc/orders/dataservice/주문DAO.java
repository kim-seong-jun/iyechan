package com.stone.springmvc.orders.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.orders.common.Orders;

@Repository
public class 주문DAO implements I주문DAO {
	@Autowired I주문Mapper orderDAO;

	@Transactional
	@Override
	public void saveOrders(Orders newOrder) {
		orderDAO.save(newOrder);
	}

	@Override
	public List<Orders> selectOrderList() {
		return orderDAO.selectAll();
	}

	@Override
	public Orders selectByNo(int orderNo) {
		return orderDAO.select(orderNo);
	}

	@Transactional
	@Override
	public void updateOrders(Orders orders) {
		orderDAO.update(orders);
	}

	@Transactional
	@Override
	public void deleteOrders(int orderNo) {
		orderDAO.delete(orderNo);
	}


}
