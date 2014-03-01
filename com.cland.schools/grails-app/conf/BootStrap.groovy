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
    }
    def destroy = {
    }
}
