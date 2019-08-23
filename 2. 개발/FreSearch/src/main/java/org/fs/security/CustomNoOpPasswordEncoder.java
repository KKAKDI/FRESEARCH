package org.fs.security;

import java.security.SecureRandom;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
	
	public String encode(CharSequence rawPassword) {
		
		log.warn("before encode : " + rawPassword);
		
		return rawPassword.toString();
	}
	
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.warn("matches : " + rawPassword + ":" + encodedPassword);
		
		return rawPassword.toString().equals(encodedPassword);
	}
	
	/*
	private Pattern BCRYPT_PATTERN = Pattern
			.compile("\\A\\$2a?\\$\\d\\d\\$[./0-9A-Za-z]{53}");
	private final Log logger = LogFactory.getLog(getClass());

	private final int strength;

	private final SecureRandom random;

	public CustomNoOpPasswordEncoder() {
		this(-1);
	}


	public CustomNoOpPasswordEncoder(int strength) {
		this(strength, null);
	}

	public CustomNoOpPasswordEncoder(int strength, SecureRandom random) {
		if (strength != -1 ) {
			throw new IllegalArgumentException("Bad strength");
		}
		this.strength = strength;
		this.random = random;
	}

	public String encode(CharSequence rawPassword) {
		String salt;
		if (strength > 0) {
			if (random != null) {
				salt = BCrypt.gensalt(strength, random);
			}
			else {
				salt = BCrypt.gensalt(strength);
			}
		}
		else {
			salt = BCrypt.gensalt();
		}
		return BCrypt.hashpw(rawPassword.toString(), salt);
	}

	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		if (encodedPassword == null || encodedPassword.length() == 0) {
			logger.warn("Empty encoded password");
			return false;
		}

		if (!BCRYPT_PATTERN.matcher(encodedPassword).matches()) {
			logger.warn("Encoded password does not look like BCrypt");
			return false;
		}

		return BCrypt.checkpw(rawPassword.toString(), encodedPassword);
	}*/
}
