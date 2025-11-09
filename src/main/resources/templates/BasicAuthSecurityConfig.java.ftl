package ${project.packageName}.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Basic Authentication security configuration.
 * Auto-generated for project: ${project.name}
 */
@Configuration
@EnableWebSecurity
public class BasicAuthSecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeHttpRequests(authz -> authz
			.requestMatchers("/api/public/**").permitAll()
				.anyRequest().authenticated()
			)
			.httpBasic();
		return http.build();
    }
}
