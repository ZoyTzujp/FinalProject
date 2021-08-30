package tw.eeit131.first.service;

import java.util.List;

import org.springframework.stereotype.Service;

import tw.eeit131.first.model.Artical;

@Service
public interface ArticalService {

	List<Artical> findAllArticals();

	void save(Artical artical);
	
	Artical selectById(Integer articalId);

	Artical updateArtical(Artical artical);

	void deleteArtical(Integer articalId);
		
	

}
