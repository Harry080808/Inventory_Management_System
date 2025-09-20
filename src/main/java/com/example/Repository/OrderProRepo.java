package com.example.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.Model.OrderProducts;

import jakarta.transaction.Transactional;

@Repository
public interface OrderProRepo extends JpaRepository<OrderProducts, Integer> {
	@Modifying
	@Transactional
	@Query("DELETE FROM OrderProducts o WHERE o.pro_name = :proName")
	void deleteByPro_name(@Param("proName") String proName);
}
