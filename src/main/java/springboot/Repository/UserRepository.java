package springboot.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springboot.model.User;

public interface UserRepository extends JpaRepository<User,Integer> {

	User getUserByEmail(String email);
	public User getUserByResetPasswordToken(String token);
	 public String qury1="select email from user where typeofuser='ADMIN' ";
 	 @Query(value = qury1,nativeQuery = true)
 	String[] getEmail();
 	 
 	 
 	public String qury2="select email from user where typeofuser='HR' ";
	 @Query(value = qury2,nativeQuery = true)
	String[] getEmailHr();
}
