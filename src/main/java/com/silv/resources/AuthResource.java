package com.silv.resources;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.silv.security.JWTUtil;
import com.silv.security.UserSecurity;
import com.silv.services.UsuarioService;

@RestController
@RequestMapping("/auth")
public class AuthResource {
	
	@Autowired
	UsuarioService usuarioService;
	@Autowired
	JWTUtil jwtUtil;

	@PostMapping("/refresh_token")
	public ResponseEntity<Void> refreshToken(HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	     String name = auth.getName(); //get logged in username
		String token = jwtUtil.generateToken(name);
		response.addHeader("Authorization", "Bearer " + token);
		return ResponseEntity.noContent().build();
	}
}
