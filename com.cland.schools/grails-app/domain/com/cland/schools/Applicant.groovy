package com.cland.schools

class Applicant {

	String firstName
	String lastName
	String address
	String contactNumber
	Date dob  
	
	static belongsTo=[parent:Parent]
	static constraints = {
		firstName(blank: false, nullable: false, maxSize: 255)
		lastName(blank: false, nullable: false, maxSize: 255)
		dob(blank: false, nullable: false, maxSize: 255)
		address(blank: false, nullable: false, maxSize: 255)
		contactNumber(nullable: true, maxSize: 255)
	}
	String toString(){
		"${firstName}"
	}
}
