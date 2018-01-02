package com.silv.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.silv.domain.Cliente;

import lombok.Data;

@Data
public class ClienteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	@NotEmpty(message="Não pode ser vazio ")
	@Length(min=5, message="Mínimo cinco caracteres", max=200)
	private String nome;
	
	@NotEmpty(message="Não pode ser vazio ")
	@Email(message="Email Inválido")
	private String email;
	
	public ClienteDTO() {

	}
	
	public ClienteDTO(Cliente cliente) {
		this.id = cliente.getId();
		this.nome = cliente.getNome();
		this.email = cliente.getEmail();
	}
	

	public ClienteDTO(Integer id, String nome, String email) {
		super();
		this.id = id;
		this.nome = nome;
		this.email = email;
	}

}
