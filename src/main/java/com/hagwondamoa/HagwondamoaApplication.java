package com.hagwondamoa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@SpringBootApplication
public class HagwondamoaApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(HagwondamoaApplication.class, args);
	}

}
