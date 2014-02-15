package com.cland.schools

class Parent {
	String firstName
	String lastName
	String email
    String address
	String contactNumber

	static hasMany=[applicants:Applicant, applications:Application]
	
    static constraints = {
		firstName(blank: false, nullable: false, maxSize: 255)
		lastName(blank: false, nullable: false, maxSize: 255)
		email(blank: false, nullable: false, maxSize: 255)
		address(blank: false, nullable: false, maxSize: 255)
		contactNumber(nullable: true, maxSize: 255)
    }
	String toString(){
		"${firstName}"
	}
}
