package xyz.ruankun.machinemother.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Lookup;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.ReplyCommentService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class ReplyCommentServiceImpl implements ReplyCommentService {

    @Autowired
    CommentRepository commentRepository;
    @Autowired
    ReplyRepository replyRepository;
    @Resource
    private ItemRepository itemRepository;
    @Resource
    private ProductRepository productRepository;
    @Resource
    private UserRepository userRepository;

    private Log logger = LogFactory.getLog(ReplyCommentServiceImpl.class);

    @Override
    @Transactional
    public Comment putComment(Comment comment) {
        Item item = itemRepository.findById(comment.getItemId().intValue());
        if (item == null) {
            logger.error("no item");
            return null;
        } else {
            Product product = productRepository.findById(item.getProductId().intValue());
            User user = userRepository.findById(item.getUserId().intValue());
            if (product != null && user != null) {
                try {
                    commentRepository.save(comment);
                    item.setComment(true);      //当评论正常保存时，item设置为已评论
                    itemRepository.save(item);
                    comment.setTitle(product.getTitle());
                    comment.setUsername(user.getName());
                    return comment;
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            } else {
                logger.error("commentid:" + comment.getId() + ", productid:" +
                        product.getId() + ", userid:" + user.getId());
                return null;
            }
        }

    }

    @Override
    public List<Comment> getComments(Integer productId) {
        List<Item> items = itemRepository.findByProductId(productId);
        List<Comment> comments = new ArrayList<>();
        if (items.size() > 0) {
            for (Item item : items) {
                //如果用户已评价，则获取评价信息
                if (item.getComment()) {
                    List<Comment> result = commentRepository.findByItemId(item.getId());
                    if (result.size() >= 0) {
                        for (Comment comment : result) {
                            try {
                                User user = userRepository.findById(comment.getUserId().intValue());
                                comment.setUsername(user.getName());
                            } catch (Exception e) {
                                e.printStackTrace();
                                return null;
                            }
                        }
                        comments.addAll(result);
                    } else {
                        return null;
                    }
                }
            }
        }
        return comments;
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
        List<Comment> comments = null;
        try {
            comments = commentRepository.findAll();
            comments = get(comments);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return comments;
    }

    @Override
    public List<Reply> getAllReplyOfOneComment(Integer commentId) {
        try {
            return replyRepository.findAllByCommentId(commentId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Comment> getCommentByRcmd(Boolean rcmd) {
        try {
            List<Comment> comments = commentRepository.findByIsRcmd(rcmd);
            comments = get(comments);
            return comments;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public boolean setCommentWithRecommend(Integer commentId, Boolean recommend) {
        try {
            Comment comment = commentRepository.findById(commentId.intValue());
            comment.setRcmd(recommend);
            commentRepository.saveAndFlush(comment);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    private List<Comment> get(List<Comment> comments) {
        List<Comment> comments1 = new ArrayList<>();
        if (comments == null) {
            return null;
        } else {
            Iterator<Comment> iterator = comments.iterator();
            while (iterator.hasNext()) {
                //去item
                Comment comment = iterator.next();
                Item item = itemRepository.findById(comment.getItemId().intValue());
                System.out.println("调试：" + item.toString());
                if (item == null) {
                    logger.error("commentid:" + comment.getId() + ", 没有item");
                    iterator.remove();
                } else {
                    //取product
                    Product product = productRepository.findById(item.getProductId().intValue());
                    User user = userRepository.findById(item.getUserId().intValue());
                    if (product != null && user != null) {
                        System.err.println("HMP");
                        comment.setTitle(product.getTitle());
                        comment.setUsername(user.getName());
                        comment.setUserAvatar(user.getAvator());
                        comments1.add(comment);
                    } else {
                        iterator.remove();
                    }
                }
            }
        }
        System.out.println("MMPO" + comments1.toString() );
        return comments1;
    }
}
