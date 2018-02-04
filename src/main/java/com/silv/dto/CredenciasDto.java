package com.silv.dto;

import java.io.Serializable;

import lombok.Data;

public class CredenciasDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String login;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	private String senha;

	public CredenciasDto() {

	}
}
