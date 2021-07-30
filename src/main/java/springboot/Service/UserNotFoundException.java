package springboot.Service;

public class UserNotFoundException extends Exception {
		/**
	 * 
	 */
	private static final long serialVersionUID = 7425791982525946211L;

		public UserNotFoundException(String message) {
		super(message);
		}
}
