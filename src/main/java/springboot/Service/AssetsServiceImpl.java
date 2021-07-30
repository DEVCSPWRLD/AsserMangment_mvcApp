package springboot.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.Repository.AssetsRepository;
import springboot.model.Assetstype;
@Service
public class AssetsServiceImpl implements AssetsService{
@Autowired
private AssetsRepository assetsrepository;
	@Override
	public List<Assetstype> getAllAssetsList() {
		// TODO Auto-generated method stub
		return assetsrepository.findAll();
	}

}
