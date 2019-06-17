package xyz.ruankun.machinemother.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Activity;
import xyz.ruankun.machinemother.entity.Announcement;
import xyz.ruankun.machinemother.service.ActivityService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.DateUtil;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
public class ActivityController {

    @Autowired
    private ResponseEntity responseEntity;

    @Autowired
    private ActivityService activityService;

    @GetMapping(value = "/notice")
    @Authentication(role = AuthAopConstant.ADMIN)   //管理员可以选择是否传参数
    public ResponseEntity getNotices(@RequestParam(value = "start", required = false) String start,
                                     @RequestParam(value = "end", required = false) String end) {
        List<Announcement> notices = null;
        if (start == null && end == null) {
            //未传入参数则默认获取全部notice信息
            notices = activityService.getNotices();
        } else {
            //根据传入的时间范围获取notice信息
            Map<String, Date> map = DateUtil.parse(start, end);
            Date error = map.get("error");
            if (error == null) {
                responseEntity.error(Constant.FORMAT_ERROR, "数据格式错误", null);
            } else {
                Date first = map.get("start");
                Date last = map.get("end");

                notices = activityService.getNotices(first, last);

            }
        }
        if (notices.size() == 0) {
            responseEntity.serverError();
        } else {
            responseEntity.success(notices);
        }
        return responseEntity;
    }

    @PostMapping(value = "/notice")
    @Authentication(role = AuthAopConstant.USER)    //用户必须传入指定日期范围
    public ResponseEntity getNotice(@RequestParam(value = "start") String start, @RequestParam(value = "end") String end) {
        //根据传入的时间范围获取notice信息
        Map<String, Date> map = DateUtil.parse(start, end);
        Date error = map.get("error");
        if (error == null) {
            responseEntity.error(Constant.FORMAT_ERROR, "数据格式错误", null);
        } else {
            Date first = map.get("start");
            Date last = map.get("end");
            List<Announcement> notices = activityService.getNotices(first, last);
            responseEntity.success(notices);
        }
        return responseEntity;
    }

    @PutMapping(value = "/notice")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity addNotice(Announcement announcement) {
        Boolean result = activityService.addNotice(announcement);
        if (result) {
            responseEntity.success(announcement);
        } else {
            responseEntity.serverError();
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/notice/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity deleteNotice(@PathVariable(value = "id") Integer id) {
        Boolean result = activityService.deleteNotice(id);
        if (result) {
            responseEntity.success(null);
        } else {
            responseEntity.serverError();
        }
        return responseEntity;
    }

    @PostMapping(value = "/activity")
    @Authentication(role = AuthAopConstant.USER)//todo 有待斟酌
    public ResponseEntity getActivities(@RequestParam(value = "timeout",defaultValue = "true")Boolean timeout) {
        List<Activity> activities = null;
        if(timeout){
            Date date = new Date();
            //结束时间在此之前
            activities = activityService.getActivities(date);
        }else{
            Date start = new Date();
            //开始时间在此之前，结束时间在此之后
            activities = activityService.getActivities(start, start);
        }
        if(activities == null){
            responseEntity.serverError();
        }else{
            responseEntity.success(activities);
        }
        return responseEntity;
    }

    @GetMapping(value = "/activity")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity getActivity() {
        List<Activity> activities = activityService.getActivities();
        if(activities== null ){
            responseEntity.serverError();
        }else {
            responseEntity.success(activities);
        }
        return responseEntity;
    }

    @PutMapping(value = "/activity")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity addActivity(Activity activity) {
        if (activityService.addActivity(activity)) {
            responseEntity.success(activity);
        } else {
            responseEntity.serverError();
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/activity/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity delete(@PathVariable(value = "id") Integer id) {
        Boolean result = activityService.deleteActivity(id);
        if (result) {
            responseEntity.success(null);
        } else {
            responseEntity.serverError();
        }
        return responseEntity;
    }
}
