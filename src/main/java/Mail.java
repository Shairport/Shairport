
   


import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class Mail
{

	//SETUP MAIL SERVER PROPERTIES
	//DRAFT AN EMAIL
	//SEND EMAIL

	String sendEmail;
	
	String ourName;
	String matchedName;
	String matchedPhone;
	String matchedEmail;
	String date;
	Session newSession = null;
	MimeMessage mimeMessage = null;
	
	
	 public Mail(String email,String matchedName, String matchedEmail,String name,String matchedPhone,String date) {
		 this.sendEmail=email;
		 this.matchedEmail=matchedEmail;
			this.matchedName=matchedName;
			this.ourName=name;
			this.matchedPhone=matchedPhone;
			
			this.date=date;
		}

	
	
	public void someonerequestedyourTicket()
	{
		setupServerProperties();
		try {
			draftEmail();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			sendEmail();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Request Email Sent.");
	}
	
	public void someoneacceptedyourRequest() {
		setupServerProperties();
		try {
			draftAcceptEmail();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			sendEmail();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Accept Email Sent.");
			
	}

	private void sendEmail() throws MessagingException {
		String fromUser = "shairporthub@gmail.com";  //Enter sender email id
		String fromUserPassword = "Degree08";  //Enter sender gmail password , this will be authenticated by gmail smtp server
		String emailHost = "smtp.gmail.com";
		Transport transport = newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserPassword);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		System.out.println("Email successfully sent!!!");
	}

	private MimeMessage draftEmail() throws AddressException, MessagingException, IOException {
		String[] emailReceipients = {sendEmail};  //Enter list of email recepients
		String emailSubject = "Shairport - Someone has Requested to Join your Ride to the Airport!";
		String emailBody = "Hello " + ourName +",\n\n" + "Your Ticket has been requested for your flight on " + date +". Request Information: "+ matchedName +"\n"+ 
    			"Phone Number: " + matchedPhone +"\n" +"Email: "+ matchedEmail +"\n"+ "Accept or decline this request on the 'My Profile' page of the Shairport Website. Steady Travels! - Shairport";
		mimeMessage = new MimeMessage(newSession);
		
		for (int i =0 ;i<emailReceipients.length;i++)
		{
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailReceipients[i]));
		}
		mimeMessage.setSubject(emailSubject);
	   
      // CREATE MIMEMESSAGE 
	    // CREATE MESSAGE BODY PARTS 
	    // CREATE MESSAGE MULTIPART 
	    // ADD MESSAGE BODY PARTS ----> MULTIPART 
	    // FINALLY ADD MULTIPART TO MESSAGECONTENT i.e. mimeMessage object 
	    
	    
		 MimeBodyPart bodyPart = new MimeBodyPart();
		// bodyPart.setContent(emailBody,"text/html; charset=utf-8\"");
		 	bodyPart.setText(emailBody);
		 MimeMultipart multiPart = new MimeMultipart();
		 multiPart.addBodyPart(bodyPart);
		 mimeMessage.setContent(multiPart);
		 return mimeMessage;
	}
	
	private MimeMessage draftAcceptEmail() throws AddressException, MessagingException, IOException {
		String[] emailReceipients = {sendEmail};  //Enter list of email recepients
		String emailSubject = "Shairport - Someone has Accepted you Request to Join Their Ride to the Airport!";
		String emailBody = "Hello " + ourName +",\n\n" + "Your request to join " + matchedName + " on their ride to the airport on " + date + " has been accepted.\n\nCarpool Information: \nName: "+ matchedName + "\n"
				+ "Phone Number: " + matchedPhone + "\n" + "Email: "+ matchedEmail +"\n\n"+ "To see all of the carpool information, go to the 'My Profile' page on the Shairport website. Steady Travels! - Shairport";
		mimeMessage = new MimeMessage(newSession);
		
		for (int i =0 ;i<emailReceipients.length;i++)
		{
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailReceipients[i]));
		}
		mimeMessage.setSubject(emailSubject);
	   
      // CREATE MIMEMESSAGE 
	    // CREATE MESSAGE BODY PARTS 
	    // CREATE MESSAGE MULTIPART 
	    // ADD MESSAGE BODY PARTS ----> MULTIPART 
	    // FINALLY ADD MULTIPART TO MESSAGECONTENT i.e. mimeMessage object 
	    
	    
		 MimeBodyPart bodyPart = new MimeBodyPart();
		// bodyPart.setContent(emailBody,"text/html; charset=utf-8\"");
		 	bodyPart.setText(emailBody);
		 MimeMultipart multiPart = new MimeMultipart();
		 multiPart.addBodyPart(bodyPart);
		 mimeMessage.setContent(multiPart);
		 return mimeMessage;
	}

	private void setupServerProperties() {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		newSession = Session.getDefaultInstance(properties,null);
	}
	
}	