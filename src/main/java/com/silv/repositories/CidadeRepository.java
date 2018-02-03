package com.silv.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.silv.domain.Cidade;

public interface CidadeRepository extends JpaRepository<Cidade, Integer> {

}
