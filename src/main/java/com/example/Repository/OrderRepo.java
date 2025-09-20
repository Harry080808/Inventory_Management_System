package com.example.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Model.Order;

@Repository
public interface OrderRepo extends JpaRepository<Order, Integer> {
	public Order findByproductId(int productId);
}
