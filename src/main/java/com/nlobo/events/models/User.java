package com.nlobo.events.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Size(min = 2, max = 25, message = "First Name must be 2 to 25 characters.")
    private String firstName;
    @Size(min = 2, max = 25, message = "Last Name must be 2 to 25 characters.")
    private String lastName;
    @NotNull
    @Size(min = 5, max = 36, message = "Email must be 5 to 36 characters.")
    @Email(message = "Please enter a valid email address.")
    private String email;
    @NotNull
    @Size(min = 2, max = 60, message = "City must be 5 to 60 characters.")
    private String city;
    @NotNull(message = "Please enter state.")
    @Size(min = 2, max = 2, message = "State must be 2 characters.")
    private String state;
    @NotNull
    @Size(min = 8, message = "Password must be at least 8 characters.")
    private String password;
    @Transient
    private String passwordConfirm;
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @OneToMany(mappedBy = "host", fetch = FetchType.LAZY)
    private List<Event> events;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Comment> comments;

    @ManyToMany(mappedBy = "usersJoined")
    List<Event> eventsJoined;

    public User() {}

    public User(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
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

    public List<Event> getEvents() {
        return events;
    }

    public void setEvents(List<Event> events) {
        this.events = events;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Event> getEventsJoined() {
        return eventsJoined;
    }

    public void setEventsJoined(List<Event> eventsJoined) {
        this.eventsJoined = eventsJoined;
    }
}
