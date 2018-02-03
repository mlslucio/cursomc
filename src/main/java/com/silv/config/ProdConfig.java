package com.silv.config;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import com.silv.services.DbService;

@Configuration
@Profile("prod")
public class ProdConfig {
	
	@Autowired
	private DbService DbService;
	
	@Bean
	public boolean instantiateDataBase() throws ParseException {
		DbService.runDev();
		return true;
	}
	
}
