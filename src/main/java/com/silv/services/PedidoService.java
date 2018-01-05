package com.silv.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silv.domain.ItemPedido;
import com.silv.domain.PagamentoComBoleto;
import com.silv.domain.Pedido;
import com.silv.domain.enums.EstadoPagamento;
import com.silv.repositories.ItemPedidoRepository;
import com.silv.repositories.PagamentoRepository;
import com.silv.repositories.PedidoRepository;
import com.silv.repositories.ProdutoRepository;
import com.silv.services.exceptions.ObjectNotFoundException;


@Service
public class PedidoService {
	
	@Autowired
	private PedidoRepository repo;
	@Autowired
	private BoletoService boletoService;
	@Autowired
	private PagamentoRepository pagamentoRepository;
	@Autowired
	private ProdutoRepository produtoRepository;
	@Autowired
	private ItemPedidoRepository itemPedidoRepository;
	
	public Pedido insert(Pedido pedido) {
		pedido.setId(null);
		pedido.setInstante(new Date());
		pedido.getPagamento().setEstado(EstadoPagamento.PENDENTE);
		pedido.getPagamento().setPedido(pedido);
		
		if(pedido.getPagamento() instanceof PagamentoComBoleto) {
			PagamentoComBoleto pgtoBoleto = (PagamentoComBoleto) 
					pedido.getPagamento();
			boletoService.preencherPagamentoComBoleto(pgtoBoleto, pedido.getInstante());
		}
		
		pedido = repo.save(pedido);
		pagamentoRepository.save(pedido.getPagamento());
		
		for (ItemPedido item : pedido.getItems()) {
			item.setDesconto(0);
			item.setPreco(produtoRepository.findOne(item.getProduto().getId()).getPreco());
			item.setPedido(pedido);
		}	
		
		itemPedidoRepository.save(pedido.getItems());
		
		return pedido;
	}
	
	public Pedido buscar(Integer id) {
		Pedido obj = repo.findOne(id);
		if(obj == null)
			throw new ObjectNotFoundException("Objeto não encontrado, id: " +id+ " tipo: "
					+Pedido.class.getName());
			
		return obj;
	}
}