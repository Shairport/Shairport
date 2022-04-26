package main.java;

import java.time.*;

public class Trip {
    private String airport;
    private LocalDate flightDate;
    private LocalTime flightTime;
    private LocalTime arriveBy;
    private LocalDateTime startTimeRange;
    private LocalDateTime endTimeRange;

    Trip() {
        airport = null;
        flightDate = null;
        flightTime = null;
        arriveBy = null;
        startTimeRange = null;
        endTimeRange = null;
    }

    public String getAirport() {
        return airport;
    }
   
    public LocalDate getFlightDate() {
        return flightDate;
    }

    public LocalTime getFlightTime() {
        return flightTime;
    }

    public LocalTime getArriveBy() {
        return arriveBy;
    }

    public LocalDateTime getStartTimeRange() {
        return startTimeRange;
    }
    
    public LocalDateTime getEndTimeRange() {
        return endTimeRange;
    }
 
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
}
