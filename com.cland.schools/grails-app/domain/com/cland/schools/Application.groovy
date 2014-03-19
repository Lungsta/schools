package com.cland.schools

class Application {

	Date application_date			//of application submitted
	SchoolLevel appliedLevel	//The grade the applicant is applying for

	static hasMany = [entries:ApplicationEntry]  //schools applied for

	static belongsTo = [applicant:Applicant]	 //applicant is already linked to parent
	static transients = ['parent']
	
    static constraints = {
		applicant(nullable: true)
		application_date(nullable: true, unique: true)
		
    }
	String toString(){
		"Application for ${applicant?.firstName}"
	}
}
