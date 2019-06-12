package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Reply;

import java.util.List;

public interface ReplyRepository extends JpaRepository<Reply,Integer> {

    List<Reply> findAllByCommentId(Integer commentId);
}
