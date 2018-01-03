package com.silv.services.validation;

import java.util.ArrayList;
import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.aspectj.weaver.NewFieldTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;

import com.silv.domain.Cliente;
import com.silv.dto.ClienteNewDTO;
import com.silv.repositories.ClienteRepository;
import com.silv.resources.exceptions.FieldMessage;

public class ClienteInsertValidator implements ConstraintValidator<ClienteInsert, ClienteNewDTO> {
	
	@Autowired
	ClienteRepository ClienteRepository;
	
	@Override
	public void initialize(ClienteInsert ann) {
	}

	@Override
	public boolean isValid(ClienteNewDTO objDto, ConstraintValidatorContext context) {
		List<FieldMessage> list = new ArrayList<>();

		Cliente cliente = ClienteRepository.findByEmail(objDto.getEmail());
		
		if(cliente != null)
			list.add(new FieldMessage("email","email já existe"));
			
		for (FieldMessage e : list) {
			context.disableDefaultConstraintViolation();
			context.buildConstraintViolationWithTemplate(e.getMessage()).addPropertyNode(e.getError())
					.addConstraintViolation();
		}
		return list.isEmpty();
	}
}