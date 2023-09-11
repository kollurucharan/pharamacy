package pack;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan("pack")
@PropertySource("classpath:database.properties")

public class AppConfig {
	@Autowired
	Environment environment;

	@Bean
	DataSource dataSource() {
		DriverManagerDataSource dmdc = new DriverManagerDataSource();
		dmdc.setUrl(environment.getProperty("url"));
		dmdc.setUsername(environment.getProperty("dbuser"));
		dmdc.setPassword(environment.getProperty("dbpassword"));
		dmdc.setDriverClassName(environment.getProperty("driver"));
		return dmdc;
	}

}
