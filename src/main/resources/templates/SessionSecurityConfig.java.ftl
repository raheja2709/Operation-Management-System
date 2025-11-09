package ${project.packageName}.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

/**
 * Session-based security configuration using Spring Security.
 * Auto-generated for project: ${project.name}
 */
@Configuration
@EnableWebSecurity
public class SessionSecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeHttpRequests(authz -> authz
				.requestMatchers("/login", "/logout", "/css/**", "/js/**").permitAll()
				.anyRequest().authenticated()
			)
			.formLogin(form -> form
				.loginPage("/login")
				.defaultSuccessUrl("/dashboard", true)
				.permitAll()
				)
			.logout(logout -> logout
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/login?logout")
				.permitAll()
			);

		return http.build();
	}
}
