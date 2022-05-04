// Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.net.URI;
import java.util.Arrays;

public class textThread extends Thread {
    // Find your Account SID and Auth Token at twilio.com/console
    // and set the environment variables. See http://twil.io/secure
    public static final String ACCOUNT_SID = "AC85da2f22827797eca277869271fc2a46";
    public static final String AUTH_TOKEN = "629f4430327a2573574af95e5200c3b2";
    public static String sendNumber;
    public textThread(String phone) {
		this.sendNumber=phone;
	}

	
	public void run() {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber(sendNumber),
                new com.twilio.type.PhoneNumber("+13254139073"),
                "Shairport- There has been an update with your ride ticket. Pairing details has been emailed to your inbox.")
            .create();

        System.out.println(message.getSid());
	}
   
}