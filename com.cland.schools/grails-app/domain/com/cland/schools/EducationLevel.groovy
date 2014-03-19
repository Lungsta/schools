package com.cland.schools

class EducationLevel {

	String name	//Typically a descriptive type name e.g. Matric otherwise will be same as level
	String level //grade r,1,2....12 - This is the standard name convention
	String comments		//this grade is for this and that kids only
    static constraints = {
    }
	
	String toString(){
		"${name}"
	}
}
