package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Activity;
import xyz.ruankun.machinemother.entity.Announcement;
import xyz.ruankun.machinemother.repository.ActivityRepository;
import xyz.ruankun.machinemother.repository.AnnouncementRepository;
import xyz.ruankun.machinemother.service.ActivityService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {


    @Resource
    private ActivityRepository activityRepository;

    @Resource
    private AnnouncementRepository announcementRepository;

    @Override
    public Boolean addNotice(Announcement announcement) {
        try {
            announcementRepository.save(announcement);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean deleteNotice(int id) {
        if (announcementRepository.getOne(id) == null) {
            return false;
        } else {
            try {
                announcementRepository.deleteById(id);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    public List<Announcement> getNotices() {
        try {
            return announcementRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List<Announcement> getNotices(Date start, Date end) {
        try {
            return announcementRepository.findAllByGmtCreateBetween(start, end);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Boolean addActivity(Activity activity) {
        try {
            activityRepository.save(activity);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean deleteActivity(int id) {
        if (activityRepository.getOne(id) == null) {
            return false;
        } else {
            try {
                activityRepository.deleteById(id);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    public List<Activity> getActivities() {
        try {
            return activityRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Activity> getActivities(Date start, Date end) {
        try {
            return activityRepository.findAllByStartAfterAndEndBefore(start, end);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Activity> getActivities(Date date) {
        try {
            return activityRepository.findAllByEndBefore(date);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
