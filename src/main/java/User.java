package main.java;

import java.util.ArrayList;

/**
 * @brief User Class
 */
public class User {
    private String id;
    private String name;
    private String img_url;
    private String email;
    private ArrayList<Trip> trips;
    private ArrayList<Ticket> tickets;

    User() {
        id = null;
        name = null;
        img_url = null;
        email = null;
    }

    /**
     * @name Getters and Setters for basic profile information
     * @{
     */

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getImgUrl() {
        return img_url;
    }

    public String getEmail() {
        return email;
    }

    public void setID(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImgUrl(String img_url) {
        this.img_url = img_url;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @}
     */

    /**
     * @name Trip stuff
     * @{
     */

    public ArrayList<Trip> getTrips() {
        return trips;
    }

    public void addTrip(Trip trip) {
        trips.add(trip);
    }

    public void addTicket(Ticket ticket) {
        tickets.add(ticket);
    }

    /**
     * }@
     */
}
