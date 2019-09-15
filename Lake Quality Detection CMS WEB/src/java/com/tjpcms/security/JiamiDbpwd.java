package com.tjpcms.security;

import java.util.Properties;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class JiamiDbpwd extends PropertyPlaceholderConfigurer{

private boolean secutiry = false;

protected String resolvePlaceholder(String placeholder, Properties props) {

	String placeholderValue = props.getProperty(placeholder);

	if (this.secutiry) {
		if (placeholder.equals("password") ) {
			try{
				placeholderValue = EncryptUtil.decrypt(placeholderValue);
			}catch(Exception e){
				
			}
			
		}
	}

	return placeholderValue;

}

public boolean isSecutiry() {

	return secutiry;
}

public void setSecutiry(boolean secutiry) {

	this.secutiry = secutiry;

}

public static void main(String[] args) throws Exception {
	System.out.println(EncryptUtil.encrypt("q111"));
}

}
