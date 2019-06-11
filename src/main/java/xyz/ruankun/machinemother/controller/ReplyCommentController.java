package xyz.ruankun.machinemother.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.Comment;
import xyz.ruankun.machinemother.entity.Reply;
import xyz.ruankun.machinemother.service.ReplyCommentService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.List;

/**
 * 该controller控制评论与回复等内容
 */
@RestController
@Api(value = "评论与回复的控制器")
public class ReplyCommentController {

    @Autowired
    ReplyCommentService replyCommentService;
    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/item/{itemId}/comment")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "新增一条评论")
    public ResponseEntity putCommentToItem(@RequestHeader String token, @PathVariable Integer itemId, @RequestBody Comment comment){
        comment.setItemId(itemId);
        comment.setUserId(Integer.parseInt(userInfoService.readDataFromRedis(token)));
        comment.setRcmd(false);//前端是无法设置是否推荐上首页的
        return getDataResult(replyCommentService.putComment(comment));
    }

    @PutMapping("/comment/{commentId}/{reply}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "管理员回复一条评论")
    public ResponseEntity reply(@RequestBody Reply reply,@PathVariable Integer commentId,@RequestHeader String token) {
        Integer adminId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        reply.setAdminId(adminId);
        return getDataResult(replyCommentService.putReply(reply));
    }

    @GetMapping("/comment")
    public ResponseEntity getComment(@RequestHeader String token){

        if (token == null) return getTrueOrFalseResult(false);

        List<Comment> comments = replyCommentService.getAllComent();
        String tk = userInfoService.readDataFromRedis(userInfoService.readDataFromRedis(token));
        if (tk == null){
            //普通用户
            for (Comment c :
                    comments) {
                if (!c.getUserId().equals(userInfoService.readDataFromRedis(token))){
                    comments.remove(c);
                }
            }
        }
        return getDataResult(comments);
    }

    /**
     * 代码这个东西浓缩就是精华
     * @param rs 真真假假
     * @return 假假真真
     */
    @小坏蛋//人生处处是惊喜
    private ResponseEntity getTrueOrFalseResult(boolean rs){
        ResponseEntity responseEntity = new ResponseEntity();
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    /**
     * 浓缩就是精华
     * @param data  缩阴功
     * @param <T> 缩阴功
     * @return 缩阴功的结果
     */
    @小坏蛋
    private <T> ResponseEntity<T> getDataResult(T data){
        ResponseEntity<T> responseEntity = new ResponseEntity<>();
        if (null != data)
            responseEntity.success(data);
        else
            responseEntity.serverError();
        return responseEntity;
    }
}
