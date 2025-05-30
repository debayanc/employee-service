package com.example.restapi;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;


@Configuration
class LoadDatabase {

    private static final Logger log = LoggerFactory.getLogger(LoadDatabase.class);

    @Bean
    CommandLineRunner initDatabase(JdbcTemplate jdbcTemplate) {
        return args -> {
            try {
                // Just verify the database connection by executing a simple query
                jdbcTemplate.queryForObject("SELECT 1", Integer.class);
                log.info("Database connection verified successfully");
            } catch (Exception e) {
                log.error("Failed to connect to database: {}", e.getMessage());
            }
        };
    }
}
