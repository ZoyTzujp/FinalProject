package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Artical;
import tw.eeit131.first.repository.ArticalRepository;


@Repository
public class ArticalRepositoryImpl implements ArticalRepository {

	@Autowired
	SessionFactory factory;
	@Autowired
	EntityManager entityManager;
	
	//查詢全部文章
	@Override
	public List<Artical> findAllArticals() {
		
		String jpql = "FROM Artical";
		return entityManager.createQuery(jpql, Artical.class)
							.getResultList();		
//		Session session = factory.getCurrentSession();
//		String hql = "FROM artical";
//		List<Artical> list = session.createQuery(hql, Artical.class)
//									.getResultList();
//		return list;
	}
	
	@Override
	public void save(Artical artical) {
		entityManager.persist(artical);
	}
	
	
	@Override
	public Artical selectById(Integer articalId) {
		return entityManager.find(Artical.class, articalId);
	}
	
	@Override
	public Artical updateArtical(Artical artical) {
		
		Artical a = selectById(artical.getArticalID());
		a.setSubject(artical.getSubject());
		a.setContent(artical.getContent());		
		entityManager.detach(a);
		return entityManager.merge(artical);		
	}
	
	@Override
	public void deleteArtical(Integer articalId) {	
		Artical a = selectById(articalId);
		System.out.println("articalId========"+articalId);
		System.out.println("a=========="+a);
		entityManager.remove(a);
	}
}





