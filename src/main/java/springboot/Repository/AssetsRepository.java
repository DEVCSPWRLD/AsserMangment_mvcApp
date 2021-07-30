package springboot.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import springboot.model.Assetstype;

public interface AssetsRepository 
	extends JpaRepository<Assetstype,Integer>{
	
}
