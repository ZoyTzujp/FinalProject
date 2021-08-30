package tw.eeit131.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.Comment;
import tw.eeit131.first.repository.CommentRepository;
import tw.eeit131.first.service.CommentService;


@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentRepository CommentRepository;

	@Override
	public List<Comment> findCommentByArticalId(Integer articalId){
		return CommentRepository.findCommentByArticalId(articalId);
	}

	@Override
	public  void saveComment(Comment comment) {
		 CommentRepository.saveComment(comment);
	}
	
	

	
}
