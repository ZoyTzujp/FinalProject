package tw.eeit131.first.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Comment;


@Repository
public interface CommentRepository {


	List<Comment> findCommentByArticalId(Integer articalId);

	void saveComment(Comment comment);
}
