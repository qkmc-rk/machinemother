package xyz.ruankun.machinemother.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Template;

import java.util.List;

public interface TemplateRepository  extends JpaRepository<Template, Integer> {

    /**
     * 找到所有的模板并返回
     * @return 模板list
     */
    List<Template> findAll();

}
