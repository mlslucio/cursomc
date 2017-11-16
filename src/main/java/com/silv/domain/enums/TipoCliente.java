package com.silv.domain.enums;

public enum TipoCliente {
	
	PESSOAFISICA(1,"Pessoa Física"),
	PESSOAJURIDICA(2, "Pessoa Jurídica");
	
	private Integer id;
	private String descricao;
	
	private TipoCliente(int id, String descricao) {
		this.id = id;
		this.descricao = descricao;
	}

	public int getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}
	
	public static TipoCliente toEnum(Integer id) {
		
		if(id == null)
			return null;
		
		for (TipoCliente x : TipoCliente.values()) {
			
			if(x.equals(id))
				return x;
		}
		
		throw new IllegalArgumentException("Id Inválaido: "+id);
	}
	
}
