package com.cland.schools

class SchoolLevel {

	EducationLevel level
	int maxFemaleCount
	int maxMaleCount
	String comments
    static constraints = {
    }
	String toString(){
		"${level?.name}"
	}
}
