package com.cland.schools

class Parent {
	String firstName1
	String lastName1
	String firstName2
	String lastName2
	String firstName3
	String lastName3
	String email
    String address
	String contactNumber

	static hasMany=[applicants:Applicant]
	
    static constraints = {
		firstName1(blank: false, nullable: false, maxSize: 255)
		lastName1(blank: false, nullable: false, maxSize: 255)
		firstName2(blank: false, nullable: false, maxSize: 255)
		lastName2(blank: false, nullable: false, maxSize: 255)
		firstName3(blank: false, nullable: false, maxSize: 255)
		lastName3(blank: false, nullable: false, maxSize: 255)
		email(blank: false, nullable: false, maxSize: 255)
		address(blank: false, nullable: false, maxSize: 255)
		contactNumber(nullable: true, maxSize: 255)
    }
	String toString(){
		"${firstName1}"
	}
}
