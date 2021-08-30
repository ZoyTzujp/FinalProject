package tw.eeit131.first.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Artical;



@Repository
public interface ArticalRepository {

public List<Artical> findAllArticals();

void save(Artical artical);

Artical selectById(Integer articalId);

Artical updateArtical(Artical artical);

void deleteArtical(Integer articalId);



		
	
	
	
}
