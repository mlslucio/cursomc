package com.silv;

import java.lang.reflect.Array;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.silv.domain.Categoria;
import com.silv.domain.Cidade;
import com.silv.domain.Estado;
import com.silv.domain.Produto;
import com.silv.repositories.CategoriaRepository;
import com.silv.repositories.CidadeRepository;
import com.silv.repositories.EstadoRepository;
import com.silv.repositories.ProdutoRepository;

@SpringBootApplication
public class CursomcApplication implements CommandLineRunner {

	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	ProdutoRepository produtoRepository;
	@Autowired
	CidadeRepository cidadeRepository;
	@Autowired
	EstadoRepository estadoRepository;
	
	public static void main(String[] args) {
		SpringApplication.run(CursomcApplication.class, args);
	}

	@Override
	public void run(String... arg0) throws Exception {
				
		Categoria cat1 = new Categoria(null,"Informática");
		Categoria cat2 = new Categoria(null,"Escritório");
		
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
		
		categoriaRepository.save(Arrays.asList(cat1, cat2));
		
		produtoRepository.save(Arrays.asList(p1,p2,p3));
		
		Estado est1 = new Estado(null, "Minas Gerais");
		Estado est2 = new Estado(null, "São Paulo");
		
		Cidade cid1 = new Cidade(null,"Uberlândia", est1);
		Cidade cid2 = new Cidade(null,"São Paulo", est2);
		Cidade cid3 = new Cidade(null,"Campinas", est2);
		
		est1.addCidade(cid1);
		est2.addCidade(cid2);
		est2.addCidade(cid3);
		
		estadoRepository.save(Arrays.asList(est1, est2));
		cidadeRepository.save(Arrays.asList(cid1, cid2, cid3));
		
		
	}
}
