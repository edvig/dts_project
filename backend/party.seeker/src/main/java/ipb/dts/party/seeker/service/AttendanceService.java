package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Attendance;
import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AttendanceService {

    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService;

    public User handleAttendance(Attendance attendance) {
        Event eventToAttend = eventService.GetEventById(attendance.getEventId());
        User userToAttend  = userService.GetUserById(attendance.getUserId());
        List<User> participants = eventToAttend.getParticipants();
        boolean userIsAlreadyOnParticipantList = participants.stream()
                .filter(p -> p.getId() == userToAttend.getId())
                .findFirst()
                .orElse(null) != null;

        if (attendance.isAttend()) {
            if(!userIsAlreadyOnParticipantList) {
                attendUserIfNotOnParticipantsList(eventToAttend, userToAttend, participants);
            }
        }
        else {
            if((userIsAlreadyOnParticipantList)) {
                unAttendUserIfOnParticipantsList(eventToAttend, userToAttend, participants);
            }
        }

        userService.SaveUser(userToAttend);
        eventService.SaveEvent(eventToAttend);

        return userToAttend;
    }

    private void attendUserIfNotOnParticipantsList(Event event, User user, List<User> participants) {
        participants.add(user);
        event.setParticipants(participants);
        user.getEvents().add(event);
    }
    private void unAttendUserIfOnParticipantsList(Event event, User user, List<User> participants){
        participants.remove(user);
        event.setParticipants(participants);
        List<Event> updatedEventList = user.getEvents()
                .stream()
                .filter(e -> e.getId() != event.getId())
                .collect(Collectors.toList());
        user.setEvents(updatedEventList);
    }
}
