package com.silv.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.silv.domain.Pagamento;

public interface PagamentoRepository extends JpaRepository<Pagamento, Integer> {

}
