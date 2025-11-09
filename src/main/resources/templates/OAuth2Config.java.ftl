package ${project.packageName}.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;

@Configuration
@ConditionalOnProperty(name = "app.security.oauth2.enabled", havingValue = "true")
public class OAuth2Config {

    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        return new InMemoryClientRegistrationRepository(
            googleClientRegistration(),
            githubClientRegistration()
        );
    }

    private ClientRegistration googleClientRegistration() {
        return ClientRegistration.withRegistrationId("google")
            .clientId("${'$'}{spring.security.oauth2.client.registration.google.client-id}")
            .clientSecret("${'$'}{spring.security.oauth2.client.registration.google.client-secret}")
            .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
            .redirectUri("${'$'}{app.base-url}/login/oauth2/code/google")
            .scope("openid", "profile", "email")
            .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
            .tokenUri("https://www.googleapis.com/oauth2/v4/token")
            .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
            .userNameAttributeName("sub")
            .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
            .clientName("Google")
            .build();
    }

    private ClientRegistration githubClientRegistration() {
        return ClientRegistration.withRegistrationId("github")
            .clientId("${'$'}{spring.security.oauth2.client.registration.github.client-id}")
            .clientSecret("${'$'}{spring.security.oauth2.client.registration.github.client-secret}")
            .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
            .redirectUri("${'$'}{app.base-url}/login/oauth2/code/github")
            .scope("read:user", "user:email")
            .authorizationUri("https://github.com/login/oauth/authorize")
            .tokenUri("https://github.com/login/oauth/access_token")
            .userInfoUri("https://api.github.com/user")
            .userNameAttributeName("id")
            .clientName("GitHub")
            .build();
    }
}
