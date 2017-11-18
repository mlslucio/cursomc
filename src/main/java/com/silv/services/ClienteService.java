package com.silv.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silv.domain.Cliente;
import com.silv.repositories.ClienteRepository;
import com.silv.services.exceptions.ObjectNotFoundException;

@Service
public class ClienteService {
	
	@Autowired
	ClienteRepository clienteRepository;
	
	public Cliente find(Integer id) {
		Cliente cliente = clienteRepository.findOne(id);
		
		if(cliente == null)
			throw new ObjectNotFoundException("Objeto não encontrado id: "+id+" tipo: "
					+ Cliente.class.getName());
		
		return cliente;
	}
}
