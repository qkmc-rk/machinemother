package xyz.ruankun.machinemother.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

    Comment save(Comment comment);

    Comment findById(int id);

    Page<Comment> findByItemId(int itemId, Pageable pageable);

    List<Comment> findByItemId(int itemId);

    Page<Comment> findByUserId(int userId, Pageable pageable);

    Page<Comment> findByItemIdAndUserId(int itemId, int userId, Pageable pageable);

    Page<Comment> findByItemIdAndScoreBetween(int itemId, int start, int end, Pageable pageable);

    List<Comment> findByIsRcmd(Boolean isRcmd);

}
