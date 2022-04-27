import java.time.*;

public class Ticket {
	private int ticketID;
    private String pickupdate; // yyyy-mm-dd
    private String airport;
    private String pickuptime; // when they want to be at the airport
    private String location; // pickup location
    private String phonenumber;
    private Integer sortingtime;

    Ticket(int t, String pd, String a, String pt, String l, String p) {
    	ticketID = t;
    	pickupdate = pd;
    	airport = a;
    	pickuptime = pt;
    	location = l;
    	phonenumber = p;

    }

    public int getTicketID() {
        return ticketID;
    }
    public String getPickupdate() {
        return pickupdate;
    }
    public String getAirport() {
        return airport;
    }
    public Integer getPickuptime() {
    	boolean isAM = true;
    	String currpickuptime = pickuptime;
    	if (pickuptime.contains("PM") || pickuptime.contains("pm")) {
    		isAM = false;
    		currpickuptime = pickuptime.substring(0, 5);
    	} else if (pickuptime.contains("AM") || pickuptime.contains("am")) {
    		currpickuptime = pickuptime.substring(0, 5);
    	}
    	String [] hourMin = currpickuptime.split(":");
    	int hour = Integer.parseInt(hourMin[0]);
    	if (!isAM) { hour += 12;}
    	int minute = Integer.parseInt(hourMin[1]);
    	return (hour * 60 + minute);
        
    }
    public String getLocation() {
        return location;
    }
    public String getPhonenumber() {
        return phonenumber;
    }
    public Integer getSortingtime() {
    	return sortingtime;
    }
    public void setSortingtime(int x) {
    	sortingtime = x;
    }

 /*
    public void setAirport(String airport) {
        this.airport = airport;
    }

    public void setFlightDate(LocalDate flightDate) {
        this.flightDate = flightDate;
    }

    public void setFlightTime(LocalTime flightTime) {
        this.flightTime = flightTime;
    }

    public void setArriveBy(LocalTime arriveBy) {
        this.arriveBy = arriveBy;
    }

    public void setStartTimeRange(LocalDateTime startTimeRange) {
        this.startTimeRange = startTimeRange;
    }
   
    public void setEndTimeRange(LocalDateTime endTimeRange) {
        this.endTimeRange = endTimeRange;
    } 
    */
}