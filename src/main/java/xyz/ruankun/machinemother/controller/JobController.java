package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.service.ServerJobService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Map;

@RestController
@RequestMapping("/serverJob")
@CrossOrigin
@Api(value = "用户控制一些服务端的任务")
public class JobController {
    @Autowired
    ServerJobService serverJobService;

    //写一个用户手动调用备份数据库的任务@
    @GetMapping("/mysqldump")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]手动执行备份mysql", notes = "备份数据库操作")
    public ResponseEntity mysqldump(){
        Map<String, String> map = serverJobService.mysqldump();
        if (map.get("error") != null){
            //发生错误
            return ControllerUtil.getFalseResultMsgBySelf(map.get("error"));
        }
        if (map.get("status") != null){
            return ControllerUtil.getSuccessResultBySelf(map.get("status"));
        }
        return ControllerUtil.getFalseResultMsgBySelf("调用serverJobService.mysqldump()没有返回预期结果，返回值：" + map.toString());
    }

}
