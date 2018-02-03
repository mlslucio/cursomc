package com.silv.services;

import java.util.List;

import org.apache.catalina.connector.ClientAbortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.silv.domain.Cidade;
import com.silv.domain.Cliente;
import com.silv.domain.Endereco;
import com.silv.domain.enums.TipoCliente;
import com.silv.dto.ClienteDTO;
import com.silv.dto.ClienteNewDTO;
import com.silv.repositories.CidadeRepository;
import com.silv.repositories.ClienteRepository;
import com.silv.repositories.EnderecoRepository;
import com.silv.services.exceptions.DataIntegrityException;
import com.silv.services.exceptions.ObjectNotFoundException;

@Service
public class ClienteService {
	
	@Autowired
	private ClienteRepository clienteRepository;
	@Autowired
	private CidadeRepository cidadeRepository;
	@Autowired
	private EnderecoRepository enderecoRepository;
	
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
	
	public Cliente fromDto(ClienteNewDTO objDto) {
		Cliente cliente = new Cliente(null,objDto.getNome(), objDto.getEmail(),
				objDto.getCpf(),TipoCliente.toEnum(objDto.getTipo()));
		
		Cidade cidade = cidadeRepository.findOne(objDto.getCidadeId());
		
		Endereco endereco = new Endereco(null, objDto.getLorgadoura(), objDto.getNumero(), 
				objDto.getComplemento(), objDto.getBairro(), objDto.getCep(),cidade, cliente);
	
		cliente.getEnderecos().add(endereco);
		
		cliente.getTelefones().add(objDto.getTelefone1());
		
		if(objDto.getTelefone2() != null)
			cliente.getTelefones().add(objDto.getTelefone2());
		if(objDto.getTelefone3() != null)
			cliente.getTelefones().add(objDto.getTelefone3());
		
		return cliente;
	}

	private void updateData(Cliente cliente, Cliente clienteDb) {
		clienteDb.setNome(cliente.getNome());
		clienteDb.setEmail(cliente.getEmail());
	}

	public Cliente insert(Cliente cliente) {
		clienteRepository.save(cliente);
		enderecoRepository.save(cliente.getEnderecos());
		return cliente;
	}
}
