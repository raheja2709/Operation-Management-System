package ${project.packageName}.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller for handling session-based authentication routes.
 * Auto-generated for project: ${project.name}
 */
@Controller
@RequestMapping
public class SessionAuthController {

	/**
	* Displays the custom login page.
	*
	* @return the login view name
	*/
	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Maps to login.html in src/main/resources/templates
	}

	/**
	* Displays the post-login dashboard or welcome page.
	*
	* @return the dashboard view
	*/
	@GetMapping("/dashboard")
	public String showDashboard() {
		return "dashboard"; // Maps to dashboard.html in src/main/resources/templates
	}

	/**
	* Optional logout success handler if you want a custom page after logout.
	*
	* @return logout page
	*/
	@GetMapping("/logout-success")
	public String logoutSuccess() {
		return "logout"; // Maps to logout.html if needed
	}
}
