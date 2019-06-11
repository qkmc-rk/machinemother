package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment,Integer> {

}
