package xyz.ruankun.machinemother;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
public class MachinemotherApplication {

	public static void main(String[] args) {
		new SpringApplication(MachinemotherApplication.class).run(args);
	}

}
