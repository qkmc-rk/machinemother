package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Comment;
import xyz.ruankun.machinemother.entity.Reply;
import xyz.ruankun.machinemother.repository.CommentRepository;
import xyz.ruankun.machinemother.repository.ReplyRepository;
import xyz.ruankun.machinemother.service.ReplyCommentService;

import java.util.List;

@Service
public class ReplyCommentServiceImpl implements ReplyCommentService {

    @Autowired
    CommentRepository commentRepository;
    @Autowired
    ReplyRepository replyRepository;

    @Override
    public Comment putComment(Comment comment) {
        try {
            return commentRepository.save(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Reply putReply(Reply reply) {
        try {
            return replyRepository.save(reply);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Comment> getAllComent() {
        try {
            return commentRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
