package xyz.ruankun.machinemother.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Comment;
import xyz.ruankun.machinemother.repository.CommentRepository;
import xyz.ruankun.machinemother.service.CommentService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private Log logger = LogFactory.getLog(CommentServiceImpl.class);

    @Resource
    private CommentRepository commentRepository;

    @Override
    public Comment add(Comment comment) {
        comment.setGmtCreate(new Date());
        comment.setGmtModified(new Date());
        return commentRepository.save(comment);
    }

    @Override
    public Comment update(Comment comment) {
        Comment check = getComment(comment.getId());
        if (check != null) {
            comment.setGmtModified(new Date());
            return commentRepository.save(comment);
        } else {
            logger.error("原始评论不存在！");
        }
        return null;
    }

    @Override
    public Comment getComment(int id) {
        return commentRepository.findById(id);
    }

    @Override
    public Page<Comment> getByItem(int itemId, Pageable pageable) {
        return commentRepository.findByItemId(itemId, pageable);
    }

    @Override
    public Page<Comment> myComment(int userId, Pageable pageable) {

        return commentRepository.findByUserId(userId, pageable);
    }

    @Override
    public Page<Comment> myItemComment(int itemId, int userId, Pageable pageable) {
        return commentRepository.findByItemIdAndUserId(itemId, userId, pageable);
    }

    @Override
    public Page<Comment> getByScore(int itemId, int start, int end, Pageable pageable) {
        return commentRepository.findByItemIdAndScoreBetween(itemId, start, end, pageable);
    }

    @Override
    public List<Comment> hotComment() {
        return commentRepository.findByIsRcmd(true);
    }
}
