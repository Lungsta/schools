package com.cland.schools

class Application {

	Date application_date;
	int grade;
	Parent parent
	Applicant applicant
	static hasMany=[schools:School]
	
    static constraints = {
		applicant(nullable: true)
		application_date(nullable: true, unique: true)
		grade blank: false, nullable: false, inList:[0,1,2,3,4,5,6,7,8,9,10,11,12]
		
    }
}
