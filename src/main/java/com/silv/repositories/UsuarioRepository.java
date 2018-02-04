package com.silv.repositories;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.silv.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, UUID> {
	
	Usuario findByLogin(String login);
}	
