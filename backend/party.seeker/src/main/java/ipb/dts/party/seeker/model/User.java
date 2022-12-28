package ipb.dts.party.seeker.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Column(name = "birthDay")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date birthDay;

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
}
