package com.cland.schools
;

public enum SystemRoles {
	ROLE_ADMIN("ROLE_ADMIN"),
	ROLE_PARENT("ROLE_PARENT"),
	final String value;
	
	SystemRoles(String value) {
		this.value = value;
	}
	
	String toString(){
		value;
	}
	
	String getKey(){
		name()
	}

	static list() {
		[ROLE_PARENT,ROLE_ADMIN]
	}
}
