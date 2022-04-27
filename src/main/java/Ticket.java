package main.java;

import java.time.LocalDateTime;
import java.util.Set;

public class Ticket {
    private Set<User> users;
    private LocalDateTime pickupTime;
    private String location;

    public Set<User> getUsers() {
        return users;
    }

    public String getLocation() {
        return location;
    }

    public LocalDateTime getPickupTime() {
        return pickupTime;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setPickupTime(LocalDateTime pickupTime) {
        this.pickupTime = pickupTime;
    }

    public void addUser(User user) {
        users.add(user);
    }

    public void removeUser(User user) {
        users.remove(user);
    }
}
