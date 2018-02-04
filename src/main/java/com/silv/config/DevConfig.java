package com.silv.config;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import com.silv.services.DbService;

@Configuration
@Profile("dev")
public class DevConfig {
	
	@Autowired
	DbService dbService;
	
	@Bean
	public boolean runDb() throws ParseException {
		//dbService.runDev();
		return true;
	}
}
