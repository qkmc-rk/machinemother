package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.Activity;
import xyz.ruankun.machinemother.entity.Announcement;

import java.util.Date;
import java.util.List;

public interface ActivityService {

    Boolean addNotice(Announcement announcement);

    Integer deleteNotice(int id);

    Announcement getNotice(int id);

    List<Announcement> getNotices();

    List<Announcement> getNotices(Date start, Date end);

    Boolean addActivity(Activity activity);

    Integer deleteActivity(int id);

    Activity getActivity(int id);

    List<Activity> getActivities();

    List<Activity> getActivities(Date start, Date end);

    List<Activity> getActivities(Date date);
}
