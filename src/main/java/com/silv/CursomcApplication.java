package com.silv;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.silv.domain.Categoria;
import com.silv.domain.Produto;
import com.silv.repositories.CategoriaRepository;
import com.silv.repositories.ProdutoRepository;

@SpringBootApplication
public class CursomcApplication implements CommandLineRunner {

	@Autowired
	CategoriaRepository categoriaRepository;
	@Autowired
	ProdutoRepository produtoRepository;
	
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
	}
}
