package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Comment;
import tw.eeit131.first.repository.CommentRepository;



@Repository
public class CommentRepositoryImpl implements CommentRepository {

	@Autowired
	EntityManager entityManager;

	
	@Override
	public List<Comment> findCommentByArticalId(Integer articalId) {
		
		String jpql = "FROM Comment where articalId = :id";
		return entityManager.createQuery(jpql, Comment.class)
							.setParameter("id", articalId)
							.getResultList();		

	}
	
	@Override
	public void saveComment(Comment comment) {
		entityManager.persist(comment);
		System.err.println("<<<<<新增成功>>>>>>");
	}
	
	
}
