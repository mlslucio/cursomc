package com.silv.resources.exceptions;

import java.util.ArrayList;
import java.util.List;

public class ValidationError extends StandardError {

	private static final long serialVersionUID = 1L;

	private List<FieldMessage> fieldMessage = new ArrayList<>();

	public ValidationError(Integer status, String msg, long timestamp) {
		super(status, msg, timestamp);
		// TODO Auto-generated constructor stub
	}

	public List<FieldMessage> getError() {
		return fieldMessage;
	}

	public void addError(String fieldMessage, String message) {
		this.fieldMessage.add(new FieldMessage(fieldMessage, message));
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
