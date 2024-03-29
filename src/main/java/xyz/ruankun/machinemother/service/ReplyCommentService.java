package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.Comment;
import xyz.ruankun.machinemother.entity.Reply;

import java.util.List;
import java.util.Map;

public interface ReplyCommentService {


    Comment putComment(Comment comment);

    Reply putReply(Reply reply);

    Map<String, List> getComments(Integer productId);

    List<Comment> getAllComent();

    List<Reply> getAllReplyOfOneComment(Integer commentId);

    List<Comment> getCommentByRcmd(Boolean rcmd);

    boolean setCommentWithRecommend(Integer commentId, Boolean recommend);
}
