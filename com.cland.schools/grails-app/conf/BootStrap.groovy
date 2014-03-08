import com.cland.schools.*
import groovy.ui.Console
import grails.util.Environment
import org.springframework.web.context.support.WebApplicationContextUtils
class BootStrap {

	def secureServiceFactory
    def init = { servletContext ->
		
		boolean showGroovyConsole = true
		
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def parentRole = new Role(authority: 'ROLE_PARENT').save(flush: true)
		def admin = new User(username: 'admin', enabled: true, password: 'Arthur43', email:'lungelo@gmail.com').save(flush: true)
		def parent = new User(username: 'Parent', enabled: true, password: 'Arthur43', email:'lungelo@gmail.com').save(flush: true)
		UserRole.create admin, adminRole
		UserRole.create parent, parentRole
		
		boolean doBootStrap = false
		switch(Environment.getCurrent()){
			case "DEVELOPMENT":
				if(doBootStrap){
				//* Admin user
				 def adminUser = new User(username: 'admin',
				 enabled: true,
				 password: 'password',
				 firstName: 'System',
				 lastName: 'Admin',
				 idNo :"3456753463453",
				 contactNo : "021334232",
				 dateOfBirth:(new Date() - 365*30),
				 gender:"Male",
				 address:"123 Main St",
				 city:"Cape Town",
				 email:"jay@whereever.com")
	
				 adminUser.save()
				 if(adminUser.hasErrors()){
					 println adminUser.errors
				 }
				 SpringSecurityUtils.doWithAuth('admin') {
					
						def devRole = new Role(authority: 'ROLE_DEVELOPER').save(flush: true, failOnError:true)
						//def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError:true)
						def agentRole = new Role(authority: 'ROLE_AGENT').save(flush: true, failOnError:true)
						def reviewerRole = new Role(authority: 'ROLE_REVIEWER').save(flush: true, failOnError:true)
	
						UserRole.create(adminUser, adminRole, true)
		
					//* Dev user
						def devUser = new User(username: 'dev',
						enabled: true,
						password: 'password',
						firstName: 'Dev',
						lastName: 'User',
						idNo :"3453333463453",
						contactNo : "021334232",
						dateOfBirth:(new Date() - 365*30),
						gender:"Male",
						address:"123 Low St",
						city:"Cape Town",
						email:"dev@whereever.com")
		
						devUser.save()
						if(devUser.hasErrors()){
							println devUser.errors
						}
						UserRole.create(devUser, devRole, true)
					//** ordinary user
						def directorUser1 = new User(username: 'mary',
						enabled: true,
						password: 'password',
						firstName: 'Mary',
						lastName: 'Brown',
						idNo :"1234567890123",
						contactNo : "011834232",
						dateOfBirth:(new Date() - 365*30),
						gender:"Female",
						address:"12 Main1 St",
						city:"Gauteng",
						email:"user1@whereever.com")
		
						directorUser1.save()
						if(directorUser1.hasErrors()){
							println directorUser1.errors
						}
						UserRole.create(directorUser1, directorRole, true)
						def directorUser2 = new User(username: 'john',
							enabled: true,
							password: 'password',
							firstName: 'John',
							lastName: 'Smith',
							idNo :"6234887800123",
							contactNo : "011834232",
							dateOfBirth:(new Date() - 365*30),
							gender:"Female",
							address:"12 Main1 St",
							city:"Gauteng",
							email:"user1@whereever.com")
			
							directorUser2.save()
							if(directorUser2.hasErrors()){
								println directorUser2.errors
							}
							UserRole.create(directorUser2, directorRole, true)
				 }
					
				} //end if doBootStrap
				break
			case "PRODUCTION" :
				if(doBootStrap) {
					//* Admin user
					 def adminUser = new User(username: 'castingadmin',
					 enabled: true,
					 password: 'Cast1Admin',
					 firstName: 'Casting',
					 lastName: 'Administrator',
					 idNo :"3456753463453",
					 contactNo : "021334232",
					 dateOfBirth:(new Date() - 365*30),
					 gender:"Male",
					 address:"123 Main St",
					 city:"Cape Town",
					 email:"jay@whereever.com")
	 
					 adminUser.save()
					 if(adminUser.hasErrors()){
						 println adminUser.errors
					 }
					 SpringSecurityUtils.doWithAuth('schoolsadmin') {
							def devRole = new Role(authority: 'ROLE_DEVELOPER').save(flush: true, failOnError:true)
							//def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError:true)
							def directorRole = new Role(authority: 'ROLE_DIRECTOR').save(flush: true, failOnError:true)
							def agentRole = new Role(authority: 'ROLE_AGENT').save(flush: true, failOnError:true)
							def reviewerRole = new Role(authority: 'ROLE_REVIEWER').save(flush: true, failOnError:true)
			
							UserRole.create(adminUser, adminRole, true)
			
						//* Dev user
							def devUser = new User(username: 'devadmin',
							enabled: true,
							password: 'Cast1Dev',
							firstName: 'Casting',
							lastName: 'Developer',
							idNo :"3453333463453",
							contactNo : "021334232",
							dateOfBirth:(new Date() - 365*30),
							gender:"Male",
							address:"123 Low St",
							city:"Cape Town",
							email:"dev@whereever.com")
			
							devUser.save()
							if(devUser.hasErrors()){
								println devUser.errors
							}
							UserRole.create(devUser, devRole, true)
					}//end with
				} //end doBootStrap
				
				break
		}
    }
    def destroy = {
    }
}
