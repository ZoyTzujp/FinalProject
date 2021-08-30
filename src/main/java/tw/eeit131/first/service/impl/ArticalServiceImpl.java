package tw.eeit131.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.Artical;
import tw.eeit131.first.repository.ArticalRepository;
import tw.eeit131.first.service.ArticalService;

@Service
@Transactional
public class ArticalServiceImpl implements ArticalService {
	
	@Autowired
	ArticalRepository articalRepository;
	
	@Override
	public List<Artical> findAllArticals() {
		return articalRepository.findAllArticals();
	}

	@Override
	public void save(Artical artical) {
		//if findById!=null...
		articalRepository.save(artical );
	}
	
	@Override
	public Artical selectById(Integer articalId) {
		return articalRepository.selectById(articalId);
	}

	@Override
	public  Artical updateArtical(Artical artical) {
		return articalRepository.updateArtical(artical);
		
	}
	
	public void deleteArtical(Integer articalId) {
		articalRepository.deleteArtical(articalId);
	}
	
}
