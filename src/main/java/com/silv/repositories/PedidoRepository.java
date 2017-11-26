package com.silv.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.silv.domain.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

}
