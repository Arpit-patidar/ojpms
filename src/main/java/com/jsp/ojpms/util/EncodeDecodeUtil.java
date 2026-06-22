package com.jsp.ojpms.util;

import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import com.jsp.ojpms.entity.User;

public class EncodeDecodeUtil {

	public static String encodeing(String password) {
		
		byte[] bytes = password.getBytes();
		
		Encoder encoder = Base64.getEncoder();
		
		String encodedPassword = encoder.encodeToString(bytes);
		
		return encodedPassword;
	}

	public static String decodeing(String encoded) {
		
//		String encoded = userObj.getPassword();

		Decoder decoder = Base64.getDecoder();

		byte[] decodedBytes = 
				decoder.decode(encoded);

		String decoded = 
				new String(decodedBytes);

		return decoded;
	}
	
}
