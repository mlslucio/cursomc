package com.silv.resources.utils;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

public class Url {
	
	public static List<Integer> decodeIntList(String s){
		List<Integer> list = new ArrayList<>();
		String[] vet = s.split(",");
		
		for (int i = 0; i < vet.length; i++) {
			list.add(Integer.parseInt(vet[i]));	
		}
		return list;
	}
	
	public static String decodeParam(String arg) {
		try {
			return URLDecoder.decode(arg, "UTF-8");
		}catch(Exception e) {
			return "";
		}
	}
}
