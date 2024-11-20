package de.dklotz.homeosspring.config;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties
public class AppConfigurations {
    @Bean
    ServerConfig serverConfig() {
        return new ServerConfig();
    }
}
