package com.silv.resources;

import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.silv.domain.Cliente;
import com.silv.dto.ClienteDTO;
import com.silv.services.ClienteService;

@RestController
@RequestMapping("/clientes")
public class ClienteResource {

	@Autowired
	ClienteService service;
	
	@GetMapping("/{id}")
	public ResponseEntity<?> find(@PathVariable Integer id){
		Cliente cliente = service.find(id);
		
		return ResponseEntity.ok().body(cliente);
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> update(@Valid @RequestBody ClienteDTO clienteDto, @PathVariable Integer id) {
		Cliente cliente = service.fromDto(clienteDto);
		cliente.setId(id);
		cliente = service.update(cliente);
		return ResponseEntity.noContent().build();
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> delete(@PathVariable Integer id) {
		service.delete(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping()
	public ResponseEntity<List<ClienteDTO>> findAll() {
		List<Cliente> clientes = service.findAll();
		
		List<ClienteDTO> listDTO = clientes.stream().map(obj -> new ClienteDTO(obj))
				.collect(Collectors.toList());	
		
		return ResponseEntity.ok().body(listDTO);
	}
	
	@GetMapping("/page")
	public ResponseEntity<Page<ClienteDTO>> findPage(@RequestParam(value="page", defaultValue="0") 
	Integer page, @RequestParam(value="linesPerPage", defaultValue="24") Integer linesPerPage, @RequestParam(value="orderby", defaultValue="nome")
	String orderBy, @RequestParam(value="direction", defaultValue="ASC") String direction
	) {
		Page<Cliente> clientes = service.findPage(page, linesPerPage, orderBy, direction);
		
		Page<ClienteDTO> listDTO = clientes.map(obj -> new ClienteDTO(obj));
		
		return ResponseEntity.ok().body(listDTO);
	}
}
