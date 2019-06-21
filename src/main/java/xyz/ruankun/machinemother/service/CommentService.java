package xyz.ruankun.machinemother.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import xyz.ruankun.machinemother.entity.Comment;

import java.util.List;

@Deprecated
public interface CommentService {

    Comment add(Comment comment);

    Comment update(Comment comment);

    Comment getComment(int id);

    Page<Comment> getByItem(int itemId, Pageable pageable);

    Page<Comment> myComment(int userId, Pageable pageable);

    Page<Comment> myItemComment(int itemId, int userId, Pageable pageable);

    Page<Comment> getByScore(int itemId, int start, int end, Pageable pageable);

    List<Comment> hotComment();

}
