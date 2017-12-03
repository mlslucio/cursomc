package com.silv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silv.domain.Pedido;
import com.silv.repositories.PedidoRepository;
import com.silv.services.exceptions.ObjectNotFoundException;

@Service
public class PedidoService {
	
	@Autowired
	private PedidoRepository repo;
	
	public Pedido buscar(Integer id) {
		Pedido obj = repo.findOne(id);
		if(obj == null)
			throw new ObjectNotFoundException("Objeto não encontrado, id: " +id+ " tipo: "
					+Pedido.class.getName());
			
		return obj;
	}
}