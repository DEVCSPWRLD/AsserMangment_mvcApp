package springboot.Service;

import java.util.List;


import springboot.model.User;

public interface UserService  {
	User saveUser(User user );
	List<User> getAllUserList();
	void updateResetPasswordToken(String token, String email) throws UserNotFoundException;
	User get(String token);
	void updatePassword(User user, String password);
	/* String updatemail(String email) throws UserNotFoundException; */
	User findByEmail(String email);
	String[] getEmail();
	String[] getEmailHr();
}
