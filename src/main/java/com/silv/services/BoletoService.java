package com.silv.services;

import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.silv.domain.PagamentoComBoleto;

@Service
public class BoletoService {
	
	public void preencherPagamentoComBoleto(PagamentoComBoleto pgtoBoleto, Date instantePedido) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(instantePedido);
		calendar.add(Calendar.DAY_OF_MONTH, 7);
		pgtoBoleto.setDataVencimento(calendar.getTime());
	}
}
