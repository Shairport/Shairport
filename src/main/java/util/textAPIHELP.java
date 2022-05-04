package util;

public class textAPIHELP {

    public static String getAPINumber(String phone) {
        String returnnumber = "+1";
        for (int i = 0; i < phone.length(); ++i) {
        	if (Character.isDigit(phone.charAt(i))) {
        		returnnumber = returnnumber + phone.charAt(i);
        	}
        }
        return returnnumber;

    }
}