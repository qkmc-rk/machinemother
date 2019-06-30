package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Activity;
import xyz.ruankun.machinemother.entity.Announcement;
import xyz.ruankun.machinemother.repository.ActivityRepository;
import xyz.ruankun.machinemother.repository.AnnouncementRepository;
import xyz.ruankun.machinemother.service.ActivityService;
import xyz.ruankun.machinemother.util.DataCode;

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
    public Integer deleteNotice(int id) {
        Announcement announcement = getNotice(id);
        if (announcement.getId() == 0) {
            return DataCode.DATA_CONFLIC;
        } else if (announcement == null) {
            return DataCode.DATA_OPERATION_ERROR;
        } else {
            try {
                Integer result = announcementRepository.deleteById(id);
                if (result <= 0) {
                    return DataCode.DATA_OPERATION_FAILURE;
                } else {
                    return DataCode.DATA_OPERATION_SUCCESS;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return DataCode.DATA_OPERATION_ERROR;
            }
        }

    }

    @Override
    public Announcement getNotice(int id) {
        try {
            Announcement announcement = announcementRepository.findById(id);
            if (announcement == null) {
                announcement = new Announcement();
                announcement.setId(0);
            }
            return announcement;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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
    public Activity getActivity(int id) {
        try {
            Activity activity = activityRepository.findById(id);
            if (activity == null) {
                activity = new Activity();
                activity.setId(0);
            }
            return activity;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer deleteActivity(int id) {
        Activity activity = getActivity(id);
        if (activity == null) {
            return DataCode.DATA_OPERATION_FAILURE;
        } else {
            try {
                if (activityRepository.deleteById(id) > 0)
                    return DataCode.DATA_OPERATION_SUCCESS;
                else
                    return DataCode.DATA_OPERATION_FAILURE;
            } catch (Exception e) {
                e.printStackTrace();
                return DataCode.DATA_OPERATION_ERROR;
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
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
