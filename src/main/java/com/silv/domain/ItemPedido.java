package com.silv.domain;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class ItemPedido implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double desconto;
	private Integer quantidade;
	private double preco;

	@EmbeddedId
	private ItemPedidoPK itemPedidoPK = new ItemPedidoPK();

	public ItemPedido() {
	}

	public ItemPedido(Pedido pedido, Produto produto, double desconto, Integer quantidade, double preco) {
		super();
		itemPedidoPK.setPedido(pedido);
		itemPedidoPK.setProduto(produto);
		this.desconto = desconto;
		this.quantidade = quantidade;
		this.preco = preco;
	}

	public double getDesconto() {
		return desconto;
	}

	public void setDesconto(double desconto) {
		this.desconto = desconto;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public Pedido getPedido() {
		return itemPedidoPK.getPedido();
	}

	public Produto getProduto() {
		return itemPedidoPK.getProduto();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((itemPedidoPK == null) ? 0 : itemPedidoPK.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemPedido other = (ItemPedido) obj;
		if (itemPedidoPK == null) {
			if (other.itemPedidoPK != null)
				return false;
		} else if (!itemPedidoPK.equals(other.itemPedidoPK))
			return false;
		return true;
	}

}
