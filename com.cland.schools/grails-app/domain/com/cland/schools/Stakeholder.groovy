package com.cland.schools

class Stakeholder {
	String name

    static constraints = {
		name blank: false, nullable: false
    }
	String toString(){
		"${name}"
	}
}
