package tw.eeit131.first.service;

import java.util.List;

import org.springframework.stereotype.Service;

import tw.eeit131.first.model.Comment;

@Service
public interface CommentService {

	  List<Comment> findCommentByArticalId(Integer articalId);

	  void saveComment(Comment comment);

	  
		
	

}
