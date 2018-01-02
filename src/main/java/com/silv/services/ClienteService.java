package com.silv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.silv.domain.Cliente;
import com.silv.dto.ClienteDTO;
import com.silv.repositories.ClienteRepository;
import com.silv.services.exceptions.DataIntegrityException;
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
	
	public Cliente update(Cliente cliente) {
		Cliente clienteDb = find(cliente.getId());
		updateData(cliente, clienteDb);
		return clienteRepository.save(clienteDb);
	}
	
	public void delete(Integer id) {
		find(id);
		
		try {
			clienteRepository.delete(id);
		}catch (DataIntegrityViolationException e) {
			throw new DataIntegrityException("Não é possível excluir uma cliente que possui pedidos");
		}
	}

	public List<Cliente> findAll() {
		// TODO Auto-generated method stub
		return clienteRepository.findAll();
	}
	
	public Page<Cliente>findPage(Integer page, Integer linesPerPage,
			String orderBy, String direction){
		 PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction),
				 orderBy);
		 return clienteRepository.findAll(pageRequest);
	}
	
	public Cliente fromDto(ClienteDTO objDto) {
		return new Cliente(objDto.getId(), objDto.getNome(), objDto.getEmail(),
				null,null);
	}

	private void updateData(Cliente cliente, Cliente clienteDb) {
		clienteDb.setNome(cliente.getNome());
		clienteDb.setEmail(cliente.getEmail());
	}
}
