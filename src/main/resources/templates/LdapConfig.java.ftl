package ${project.packageName}.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.LdapContextSource;
import org.springframework.security.ldap.authentication.BindAuthenticator;
import org.springframework.security.ldap.authentication.LdapAuthenticationProvider;
import org.springframework.security.ldap.search.FilterBasedLdapUserSearch;
import org.springframework.security.ldap.userdetails.DefaultLdapAuthoritiesPopulator;

@Configuration
@ConditionalOnProperty(name = "app.security.ldap.enabled", havingValue = "true")
public class LdapConfig {

    @Bean
    public LdapContextSource contextSource() {
        LdapContextSource contextSource = new LdapContextSource();
        contextSource.setUrl("${'$'}{app.ldap.url}");
        contextSource.setBase("${'$'}{app.ldap.base}");
        contextSource.setUserDn("${'$'}{app.ldap.username}");
        contextSource.setPassword("${'$'}{app.ldap.password}");
        return contextSource;
    }

    @Bean
    public LdapTemplate ldapTemplate() {
        return new LdapTemplate(contextSource());
    }

    @Bean
    public LdapAuthenticationProvider ldapAuthenticationProvider() {
        FilterBasedLdapUserSearch userSearch = new FilterBasedLdapUserSearch(
            "${'$'}{app.ldap.user-search-base}", 
            "${'$'}{app.ldap.user-search-filter}", 
            contextSource()
        );
        
        BindAuthenticator bindAuthenticator = new BindAuthenticator(contextSource());
        bindAuthenticator.setUserSearch(userSearch);
        
        DefaultLdapAuthoritiesPopulator authoritiesPopulator = new DefaultLdapAuthoritiesPopulator(
            contextSource(), 
            "${'$'}{app.ldap.group-search-base}"
        );
        authoritiesPopulator.setGroupSearchFilter("${'$'}{app.ldap.group-search-filter}");
        
        return new LdapAuthenticationProvider(bindAuthenticator, authoritiesPopulator);
    }
}
