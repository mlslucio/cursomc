package com.silv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silv.domain.Categoria;
import com.silv.repositories.CategoriaRepository;
import com.silv.services.exceptions.ObjectNotFoundException;

@Service
public class CategoriaService {

	@Autowired
	private CategoriaRepository repo;

	public Categoria find(Integer id) {
		Categoria obj = repo.findOne(id);
		if (obj == null)
			throw new ObjectNotFoundException(
					"Objeto não encontrado, id: " + id + " tipo: " + Categoria.class.getName());

		return obj;
	}

	public Categoria insert(Categoria categoria) {
		categoria.setId(null);
		return repo.save(categoria);
	}

	public Categoria update(Categoria categoria) {
		find(categoria.getId());
		return repo.save(categoria);
	}

}