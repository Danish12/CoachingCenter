package com.fagnum.services.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptedPasswordGenerator {

	public static String encryptedPassword(String value) throws NoSuchAlgorithmException {
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");
		byte byteData[] = messageDigest.digest(value.getBytes());

		StringBuffer newPassword = new StringBuffer();

		for (int i = 0; i < byteData.length; i++) {
			newPassword.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		String password = new String(newPassword);
		return password;
	}
}
