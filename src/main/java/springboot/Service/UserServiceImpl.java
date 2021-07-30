package springboot.Service;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

import org.slf4j.Logger;


import springboot.Repository.UserRepository;
import springboot.model.User;

@Service
public class UserServiceImpl  implements UserService{
	
	private static final Logger logger=LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public User saveUser(User user)
	{
		User useVal=null;
		try
		{
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            user.setPassword(passwordEncoder.encode(user.getPassword()));
			useVal=userRepository.save(user);
		}catch(Exception e)
		{
			logger.error(e.getMessage());
		}
		return useVal;
	}

	@Override
	public List<User> getAllUserList() {
		return userRepository.findAll();
	}
	

    public void updateResetPasswordToken(String token, String email) throws UserNotFoundException {
        	User user = userRepository.getUserByEmail(email);
        if (user != null) {
            user.setResetPasswordToken(token);
            userRepository.save(user);
        } else {
            throw new UserNotFoundException("Could not find any user with the email: " + email);
        }
    }
     
    public User get(String resetPasswordToken) {
        return userRepository.getUserByResetPasswordToken(resetPasswordToken);
    }
     
    public void updatePassword(User user, String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(password);
        user.setPassword(encodedPassword);
         
        user.setResetPasswordToken(null);
        userRepository.save(user);
    }

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.getUserByEmail(email);
	}

	@Override
	public String[] getEmail() {
		// TODO Auto-generated method stub
		return userRepository.getEmail();
	}

	@Override
	public String[] getEmailHr() {
		// TODO Auto-generated method stub
		return userRepository.getEmailHr();
	}
}
