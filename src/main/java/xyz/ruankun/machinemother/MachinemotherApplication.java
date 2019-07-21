package xyz.ruankun.machinemother;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
@EnableScheduling		//开启调度任务
public class MachinemotherApplication {
	public static void main(String[] args) {
	    new SpringApplication(MachinemotherApplication.class).run(args);
	}
}
