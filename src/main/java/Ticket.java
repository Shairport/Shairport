package main.java;

import java.time.LocalDateTime;
import java.util.Set;

public class Ticket {
    private Set<User> users;
    private LocalDateTime departure;
    private String location;

    public Set<User> getUsers() {
        return users;
    }

    public String getLocation() {
        return location;
    }

    public LocalDateTime getDeparture() {
        return departure;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setDeparture(LocalDateTime departure) {
        this.departure = departure;
    }

    public void addUser(User user) {
        users.add(user);
    }

    public void removeUser(User user) {
        users.remove(user);
    }
}
