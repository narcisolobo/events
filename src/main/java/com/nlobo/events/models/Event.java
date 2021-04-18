package com.nlobo.events.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "events")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull(message = "Please enter an event name.")
    @Size(min = 5, max = 60, message = "Event name must be 5 to 60 characters.")
    private String name;
    @NotNull(message = "Please enter city.")
    @Size(min = 2, max = 60, message = "City must be 5 to 60 characters.")
    private String city;
    @NotNull(message = "Please enter state.")
    @Size(min = 2, max = 2, message = "State must be 2 characters.")
    private String state;
    @Future(message = "Date must be in the future.")
    @NotNull(message = "Please enter date of event.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "host_id")
    private User host;

    @OneToMany(mappedBy = "event", fetch = FetchType.LAZY)
    private List<Comment> comments;

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @ManyToMany
    @JoinTable(
            name = "users_joined",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    List<User> usersJoined;

    public Event() {}

    public Event(String name, String city, String state, Date date, User host) {
        this.name = name;
        this.city = city;
        this.state = state;
        this.date = date;
        this.host = host;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public User getHost() {
        return host;
    }

    public void setHost(User host) {
        this.host = host;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<User> getUsersJoined() {
        return usersJoined;
    }

    public void setUsersJoined(List<User> usersJoined) {
        this.usersJoined = usersJoined;
    }
}
