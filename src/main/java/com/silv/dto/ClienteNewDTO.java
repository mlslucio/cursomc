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
	/**
	 * 
	 */
	@NotEmpty(message="Não pode ser vazio ")
	@Length(min=5, message="Mínimo cinco caracteres", max=200)
	private String nome;
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public String getLorgadoura() {
		return lorgadoura;
	}

	public void setLorgadoura(String lorgadoura) {
		this.lorgadoura = lorgadoura;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getTelefone3() {
		return telefone3;
	}

	public void setTelefone3(String telefone3) {
		this.telefone3 = telefone3;
	}

	public Integer getCidadeId() {
		return cidadeId;
	}

	public void setCidadeId(Integer cidadeId) {
		this.cidadeId = cidadeId;
	}

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
