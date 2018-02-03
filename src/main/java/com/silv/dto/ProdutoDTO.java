package com.silv.dto;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.silv.domain.Produto;

import lombok.Data;

@Data
public class ProdutoDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;

	@NotEmpty(message = "o campo nome não pode ser vazio")
	@Length(min = 5, max = 10, message = "minimo 5, máximo 10")
	private String nome;

	private Double preco;

	public ProdutoDTO() {

	}
	
	public ProdutoDTO(Produto produto) {
		this.id = produto.getId();
		this.nome = produto.getNome();
		this.preco = produto.getPreco();
	}

	public ProdutoDTO(Integer id, String nome, Double preco) {
		super();
		this.id = id;
		this.nome = nome;
		this.preco = preco;
	}

}
