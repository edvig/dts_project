package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Attendance;
import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceService {

    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService;

    public User handleAttendance(Attendance attendance) {
        Event event = eventService.GetEventById(attendance.getEventId());
        User user  = userService.GetUserById(attendance.getUserId());
        System.out.println("uid: "+user.getId());
        List<User> userList = event.getParticipants();
        var lengthBefore = userList.size();
        userList.add(user);
        event.setParticipants(userList);
        user.getEvents().add(event);
        return user;
    }
}
