package xyz.ruankun.machinemother.service;

import java.util.Map;

public interface ServerJobService {

    /**
     * 触发备份数据库，配置信息参照具体方法内具体参数
     * @return
     */
    Map<String, String> mysqldump();
}
