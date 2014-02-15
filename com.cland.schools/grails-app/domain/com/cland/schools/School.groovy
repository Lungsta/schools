package com.cland.schools

class School {
	String name 
	String address
	String grade
	String avail_space
	
	static belongsTo=[application:Application]

    static constraints = {
    }
}
