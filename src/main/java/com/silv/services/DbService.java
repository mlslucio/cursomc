package com.silv.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silv.domain.Categoria;
import com.silv.domain.Cidade;
import com.silv.domain.Cliente;
import com.silv.domain.Endereco;
import com.silv.domain.Estado;
import com.silv.domain.ItemPedido;
import com.silv.domain.Pagamento;
import com.silv.domain.PagamentoComBoleto;
import com.silv.domain.PagamentoComCartao;
import com.silv.domain.Pedido;
import com.silv.domain.Produto;
import com.silv.domain.enums.EstadoPagamento;
import com.silv.domain.enums.TipoCliente;
import com.silv.repositories.CategoriaRepository;
import com.silv.repositories.CidadeRepository;
import com.silv.repositories.ClienteRepository;
import com.silv.repositories.EnderecoRepository;
import com.silv.repositories.EstadoRepository;
import com.silv.repositories.ItemPedidoRepository;
import com.silv.repositories.PagamentoRepository;
import com.silv.repositories.PedidoRepository;
import com.silv.repositories.ProdutoRepository;

@Service
public class DbService {

	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	ProdutoRepository produtoRepository;
	@Autowired
	CidadeRepository cidadeRepository;
	@Autowired
	EstadoRepository estadoRepository;
	@Autowired
	ClienteRepository clienteRepository;
	@Autowired
	EnderecoRepository enderecoRepository;
	@Autowired
	PedidoRepository pedidoRepository;
	@Autowired
	PagamentoRepository pagamentoRepository;
	@Autowired
	ItemPedidoRepository itemPedidoRepository;

	public void runDev() throws ParseException {

		Categoria cat1 = new Categoria(null, "Informática");
		Categoria cat2 = new Categoria(null, "Escritório");
		Categoria cat3 = new Categoria(null, "Jardinagem");
		Categoria cat4 = new Categoria(null, "Pesca");
		Categoria cat5 = new Categoria(null, "Cama, mesa e banho");
		Categoria cat6 = new Categoria(null, "Alimentação");

		Produto p1 = new Produto("Computador", 3000.00);
		Produto p2 = new Produto("Impressora", 800.00);
		Produto p3 = new Produto("Mouse", 80.00);

		cat1.addProduto(p1);
		cat1.addProduto(p2);
		cat1.addProduto(p3);
		cat2.addProduto(p2);

		p1.addCategoria(cat1);
		p2.addCategoria(cat1);
		p2.addCategoria(cat2);
		p3.addCategoria(cat1);

		categoriaRepository.save(Arrays.asList(cat1, cat2, cat3, cat4, cat5, cat6));

		produtoRepository.save(Arrays.asList(p1, p2, p3));

		Estado est1 = new Estado(null, "Minas Gerais");
		Estado est2 = new Estado(null, "São Paulo");

		Cidade cid1 = new Cidade(null, "Uberlândia", est1);
		Cidade cid2 = new Cidade(null, "São Paulo", est2);
		Cidade cid3 = new Cidade(null, "Campinas", est2);

		est1.addCidade(cid1);
		est2.addCidade(cid2);
		est2.addCidade(cid3);

		estadoRepository.save(Arrays.asList(est1, est2));
		cidadeRepository.save(Arrays.asList(cid1, cid2, cid3));

		Cliente cli1 = new Cliente(null, "Maria Silva", "maria@gmail.com", "123123123", TipoCliente.PESSOAFISICA);
		cli1.addTelefone("31 12312323");
		cli1.addTelefone("31 12435422323");

		Endereco e1 = new Endereco(null, "Rua flores", "304", "apto 303", "jardim", "123123", cid1, cli1);
		Endereco e2 = new Endereco(null, "Rua arvores", "453", "casa", "foresta", "2342432", cid2, cli1);

		cli1.getEnderecos().addAll(Arrays.asList(e1, e2));

		clienteRepository.save(cli1);

		enderecoRepository.save(e1);
		enderecoRepository.save(e2);

		SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy hh:mm");

		Pedido ped1 = new Pedido(date.parse("30/09/2017 22:32"), cli1, e1);
		Pedido ped2 = new Pedido(date.parse("30/09/2017 22:32"), cli1, e2);

		Pagamento pagto1 = new PagamentoComCartao(EstadoPagamento.QUITADO, ped1, 6);
		ped1.setPagamento(pagto1);

		Pagamento pagto2 = new PagamentoComBoleto(EstadoPagamento.PENDENTE, ped2, date.parse("20/10/2017 00:00"), null);
		ped2.setPagamento(pagto2);

		cli1.getPedidos().addAll(Arrays.asList(ped1, ped2));

		pedidoRepository.save(Arrays.asList(ped1, ped2));
		pagamentoRepository.save(Arrays.asList(pagto1, pagto2));

		ItemPedido item1 = new ItemPedido(ped1, p1, 0.00, 1, 2000);
		ItemPedido item2 = new ItemPedido(ped1, p3, 0.00, 2, 80);
		ItemPedido item3 = new ItemPedido(ped2, p2, 100.00, 1, 800);

		ped1.getItems().addAll(Arrays.asList(item1, item2));
		ped2.getItems().addAll(Arrays.asList(item3));

		p1.getItems().addAll(Arrays.asList(item1));
		p2.getItems().addAll(Arrays.asList(item3));
		p3.getItems().addAll(Arrays.asList(item2));

		itemPedidoRepository.save(Arrays.asList(item1, item2, item3));

	}
}
