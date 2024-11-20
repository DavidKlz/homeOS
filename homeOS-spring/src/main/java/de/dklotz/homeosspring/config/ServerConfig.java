package de.dklotz.homeosspring.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "source")
@Getter
@Setter
public class ServerConfig {
    private String root = "E:/homeOS";
}
