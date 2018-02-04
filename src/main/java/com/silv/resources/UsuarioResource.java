package com.silv.resources;

import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.silv.domain.Usuario;
import com.silv.services.UsuarioService;

@RestController
@RequestMapping("/usuarios")
public class UsuarioResource {

	@Autowired
	UsuarioService usuarioService;

	@GetMapping("/{id}")
	public ResponseEntity<?> find(@PathVariable UUID id) {
		Usuario usuario = usuarioService.find(id);
		return ResponseEntity.ok().body(usuario);
	}
	
	@GetMapping()
	public ResponseEntity<List<Usuario>> findAll() {
		List<Usuario> usuarios = usuarioService.findAll();
		return ResponseEntity.ok().body(usuarios);
	}

	@PostMapping()
	public ResponseEntity<?> insert(@Valid @RequestBody Usuario usuario) {
		usuario = usuarioService.insert(usuario);
		//emailService.sendEmail(usuario.getNome(), usuario.getEmail(), "Usuario cadastrado");
		return ResponseEntity.ok().build();
	}
	
	@PutMapping()
	public ResponseEntity<?> update(@RequestBody Usuario usuario) {
		usuario = usuarioService.update(usuario);
		return ResponseEntity.noContent().build();
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> delete(@PathVariable UUID id) {
		usuarioService.delete(id);
		return ResponseEntity.noContent().build();
	}

}
