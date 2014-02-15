package com.cland.schools

class Stakeholder {
	String name
	String contactNumber

    static constraints = {
		name blank: false, nullable: false
		contactNumber: nullable: true
    }
}
