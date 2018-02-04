package com.silv.services;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.silv.domain.Usuario;
import com.silv.repositories.UsuarioRepository;
import com.silv.services.exceptions.DataIntegrityException;
import com.silv.services.exceptions.ObjectNotFoundException;

@Service
public class UsuarioService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	private BCryptPasswordEncoder bCrypt;

	public List<Usuario> findAll() {
		return usuarioRepository.findAll();
	}

	public Usuario find(UUID id) {

		Usuario obj = usuarioRepository.findOne(id);
		if (obj == null)
			throw new ObjectNotFoundException("Objeto não encontrado, id: " + id + " tipo: " + Usuario.class.getName());

		return obj;
	}

	public Usuario insert(Usuario usuario) {
		usuario.setSenha(bCrypt.encode(usuario.getSenha()));
		System.out.println(usuario);
		return usuarioRepository.save(usuario);
	}

	public Usuario update(Usuario usuario) {
		usuario.setSenha(bCrypt.encode(usuario.getSenha()));
		return usuarioRepository.save(usuario);
	}

	public void delete(UUID id) {
		find(id);

		try {
			usuarioRepository.delete(id);
		} catch (DataIntegrityViolationException e) {
			throw new DataIntegrityException("Não é possível excluir um usuario que possui um cliente");
		}
	}

}
