package ipb.dts.party.seeker.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "EVENTS")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer Id;

    @Column(name = "TITLE")
    private String title;

    @Column(name = "LOCATION")
    private String location;

    @Column(name = "PRICE")
    private double price;

    @Column(name = "LIMIT_OF_ATTENDANTS")
    private Integer limitOfAttendants;

    @Column(name = "MIN_AGE_TO_ATTEND")
    private Integer minAgeToAttend;

    @Column(name = "DATE")
    private LocalDate date;

    @Column(name = "TIME_OF_START")
    private String timeOfStart;

//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @JoinColumn(name = "USER_ID", nullable = false)
//    private User organizer;
//
    @ManyToMany()
    @Column(name = "user_id")
    @JsonIgnore
    private List<User> participants;

}
