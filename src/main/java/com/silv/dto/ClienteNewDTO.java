package com.silv.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.br.CPF;

import com.silv.services.validation.ClienteInsert;

import lombok.Data;

@ClienteInsert
@Data
public class ClienteNewDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	//cliente
	@NotEmpty(message="Não pode ser vazio ")
	@Length(min=5, message="Mínimo cinco caracteres", max=200)
	private String nome;
	
	@NotEmpty(message="Não pode ser vazio ")
	@Email(message="Email Inválido")
	private String email;
	
	@CPF
	@NotEmpty(message="Não pode ser vazio ")
	private String cpf;
	
	private Integer tipo;
	
	//endereco
	@NotEmpty(message="Não pode ser vazio ")
	private String lorgadoura;

	@NotEmpty(message="Não pode ser vazio ")
	private String numero;
	
	private String complemento;
	private String bairro;
	
	@NotEmpty(message="Não pode ser vazio ")
	private String cep;
	
	//telefones
	@NotEmpty(message="Não pode ser vazio ")
	private String telefone1;
	
	private String telefone2;
	private String telefone3;
	
	//cidade
	private Integer cidadeId;
	
}
