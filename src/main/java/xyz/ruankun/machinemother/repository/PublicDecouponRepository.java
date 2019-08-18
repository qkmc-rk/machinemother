package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import xyz.ruankun.machinemother.entity.PublicDecoupon;

import java.util.Set;

/**
 * @Author Jason
 * @CreateTime 2019/8/12 9:10
 * @Modify 2019/8/12 9:10
 * @Version 1.0
 */
public interface PublicDecouponRepository extends JpaRepository<PublicDecoupon, Integer> {

    PublicDecoupon findById(int id);

    Set<PublicDecoupon> findAllByValidIsTrue();

    @Query(value = "select pd.id as id, pd.createtime as createTime, pd.endtime as endTime," +
            " pd.min as min, pd.remarks as remarks, pd.starttime as starttime," +
            " pd.valid as valid, pd.worth as worth from mm_pubdecoupon pd where valid = true and id not in " +
            "(select public_decoupon from mm_pbdcp_get where userId=?1)", nativeQuery = true)
    Set<PublicDecoupon> findDecoupon(Integer userId);

    @Modifying
    @Query(value = "update mm_pubdecoupon set starttime=#{startTime}," +
            "endtime=#{endTime}, valid=#{valid} where id=#{id}", nativeQuery = true)
    void update(PublicDecoupon publicDecoupon);

    @Modifying
    @Query(value = "insert into mm_pbdcp_get(userId, public_decoupon)" +
            "values(?1, ?2)", nativeQuery = true)
    void saveRelation(Integer userId, Integer decouponId);

    @Query(value = "select id from mm_pbdcp_get where userId=?1 and public_decoupon=?2", nativeQuery = true)
    Integer isGet(Integer userId, Integer decouponId);
}
