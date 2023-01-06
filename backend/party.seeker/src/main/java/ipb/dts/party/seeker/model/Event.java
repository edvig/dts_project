package ipb.dts.party.seeker.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    private Double price;

    @Column(name = "LIMIT_OF_ATTENDANTS")
    private Integer limitOfAttendants;

    @Column(name = "MIN_AGE_TO_ATTEND")
    private Integer minAgeToAttend;

    @Column(name = "DATEANDTIME")
    @JsonIgnore
    private LocalDateTime dateAndTime;

    public void setDateAndTime(String dateTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        this.dateAndTime = LocalDateTime.parse(dateTime, formatter);
    }

    private String dateTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID")
    private User organizer;

    @Column(name = "organizerId")
    private Integer organizerId;

    @ManyToMany()
    @Column(name = "user_id")
    @JsonIgnore
    private List<User> participants = new ArrayList<>();

    @Column(name = "numOfParticipants")
    @Transient
    @Getter(AccessLevel.NONE)
    private long numOfParticipants;

    public long getNumOfParticipants(){
        return participants.stream().count();
    }
}
