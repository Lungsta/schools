package com.cland.schools

class School {
	String name 
	Date appStatDate
	Date appCloseDate
	
	static hasMany = [levels:SchoolLevel] //grade 1 to 3

    static constraints = {
		name nullable: false, blank: false, unique: true
        appStatDate unique: true, nullable: false, blank: false
		appCloseDate unique: true, nullable: false, blank: false
}
	String toString(){
		"${name}"
	}
}