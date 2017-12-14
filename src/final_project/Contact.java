package final_project;

public class Contact {
	
	/** member variables */
	private String contactName;
	private String contactEmail;
	private String contactSubject;
	private String contactMessage;
	// if email were to be added, these are the fields
	
	/** member setters */
	public void setContactName(String name) {
		contactName = name;
	}
	public void setContactEmail(String email) {
		contactEmail = email;
	}
	public void setContactSubject(String subject) {
		contactSubject = subject;
	}
	public void setContactMessage(String message) {
		contactMessage = message;
	}
	
	/** member getters */
	public String getContactName() {
		return contactName;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public String getContactSubject() {
		return contactSubject;
	}
	public String getContactMessage() {
		return contactMessage;
	}
}
