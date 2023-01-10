package ipb.dts.party.seeker.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import ipb.dts.party.seeker.view.UserView;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Entity
@Table(name = "USERS")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "USER_ID")
    private Integer id;

    @Column(name = "FIRST_NAME")
    private String firstName;

    @Column(name = "LAST_NAME")
    private String lastName;

    @Column(name = "EMAIL_ADDRESS", unique = true)
    private String emailAddress;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "USERNAME", unique = true)
    private String username;

    @Column(name = "BIRTHDAYDATE")
    @JsonIgnore
    private LocalDateTime birthdayDate;

    public void setBirthdayDate(String birthday) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        this.birthdayDate = LocalDateTime.parse(birthday, formatter);
    }

    private String birthday;

    // This relationship is to list the events organized by the user.
    // One event can have one organizer, one user can organize multiple events.
    @OneToMany
    @JsonIgnore
    private List<Event> myEvents;

    // This relationship is to list the events where the user
    @ManyToMany
    @Column(name = "event_id")
    @JsonIgnore
    private List<Event> events;

    public boolean removeOrganizedEventById(Integer eventId){
        Integer sizeBefore = myEvents.size();
        Event eventToRemoveOpt = myEvents.stream().filter(event -> event.getId() == eventId).findAny().orElse(null);
        myEvents.remove(eventToRemoveOpt);
        return sizeBefore>myEvents.size();
    }

    public boolean removeAttendedEventById(Integer eventId){
        Integer sizeBefore = events.size();
        Event eventToRemoveOpt = events.stream().filter(event -> event.getId() == eventId).findAny().orElse(null);
        events.remove(eventToRemoveOpt);
        return sizeBefore>events.size();
    }
}
