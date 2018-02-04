package com.silv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.silv.domain.Usuario;
import com.silv.repositories.UsuarioRepository;
import com.silv.security.UserSecurity;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	UsuarioRepository usuarioRepository;
	
	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Usuario usuario =  usuarioRepository.findByLogin(login);
		
		return new UserSecurity(usuario.getId(), usuario.getLogin(), 
				usuario.getSenha()); 
	}

}
