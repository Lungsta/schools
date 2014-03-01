package com.cland.schools

class School {
	String name 
	String address
	int grade
	String avail_space
	
	static belongsTo=[application:Application]

    static constraints = {
		name nullable: false, blank: false, unique: true
        address unique: true, nullable: false, blank: false
		grade unique: true, nullable: false, blank: false
}
}