package com.cland.schools

class Applicant {

	String firstName
	String lastName
	String address
	String contactNumber
	Date dob  
	
	static belongsTo=[parent:Parent]
	static constraints = {
		firstName(blank: false, nullable: false)
		lastName(blank: false, nullable: false)
		dob(blank: false, nullable: false)
		address(blank: false, nullable: false)
		contactNumber(nullable: true)
	}
	String toString(){
		"${firstName}"
	}
}
