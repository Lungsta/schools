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
		firstName1(blank: false, nullable: false)
		lastName1(blank: false, nullable: false)
		firstName2(blank: false, nullable: false)
		lastName2(blank: false, nullable: false)
		firstName3(blank: false, nullable: false)
		lastName3(blank: false, nullable: false)
		email(blank: false, nullable: false)
		address(blank: false, nullable: false)
		contactNumber(nullable: true)
    }
	String toString(){
		"${lastName1}"
	}
}
