package com.cland.schools

class Application {

	Date application_date;
	int minGrade;
	int maxGrade;
	
	static belongsTo=[parent:Parent,applicant:Applicant]
	static hasMany=[schools:School]
	
    static constraints = {
		applicant(nullable: true)
		application_date(nullable: true, unique: true)
		minGrade(blank: false, nullable: false, inList:[0..11])
		maxGrade(blank: false, nullable: false, inList:[1..12])
		
    }
}
