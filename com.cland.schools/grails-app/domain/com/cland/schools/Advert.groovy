package com.cland.schools

class Advert {
    String name
	String description
	Date created
	
    static constraints = {
		name(blank: false, nullable: false)
		description(nullable: true)
		created(nullable: false, blank: false)
    }
	String toString(){
		"${name}"
	}
}
