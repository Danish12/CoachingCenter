package com.fagnum.test;

import java.security.MessageDigest;


public class HashingTechnique {
	public static void main(String[] args) {
		System.out.println(getHash("danish"));
		System.out.println(getHash("NegotiableimagesHas"));
		System.out.println(getHash("aftermarriageimages"));
		System.out.println(getHash("sweetimageshas"));
	}
	public static String getHash(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");

			byte[] dataBytes = str.getBytes();
			byte[] mdbytes = md.digest(dataBytes);

			// convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) {
				sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16)
						.substring(1));
			}

			return sb.toString();
		} catch (Exception e) {
			
		}
		return str;
	}
	
}
