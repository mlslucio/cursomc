package com.silv.domain;

import java.util.Date;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.silv.domain.enums.EstadoPagamento;

@Entity
public class PagamentoComBoleto extends Pagamento {
	
	private static final long serialVersionUID = 1L;
	@JsonFormat(pattern="dd/mm/yyyy hh:mm")
	private Date dataVencimento;
	@JsonFormat(pattern="dd/mm/yyyy hh:mm")
	private Date dataPagamento;
	
	public PagamentoComBoleto() {
		
	}

	public PagamentoComBoleto(EstadoPagamento estado, Pedido pedido, Date dataVencimento,Date dataPagamento ) {
		super(estado, pedido);
		this.dataPagamento = dataPagamento;
		this.dataVencimento= dataVencimento;
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}
	
	
	
}
