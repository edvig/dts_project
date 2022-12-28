package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.model.Attendance;
import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.service.AttendanceService;
import ipb.dts.party.seeker.service.EventService;
import ipb.dts.party.seeker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/events")
public class EventController {

    @Autowired
    EventService eventService;

    @Autowired
    UserService userService;

    @Autowired
    AttendanceService attendanceService;

    @PostMapping()
    public ResponseEntity<Event> PostEvent(@RequestBody Event newEvent) {
        return ResponseEntity.of(Optional.of(userService.setUserForNewEvent(newEvent)));
    }

    @GetMapping()
    public ResponseEntity<List<Event>> GetEvents() {
        return ResponseEntity.of(Optional.of(eventService.GetAllEvents()));
    }

    @GetMapping("/upcoming")
    public ResponseEntity<List<Event>> GetUpcomingEvents() {
        return ResponseEntity.of(Optional.of(eventService.GetUpcomingEvents()));
    }

    @GetMapping("/{eventId}")
    public ResponseEntity<Object> GetEvent(@PathVariable Integer eventId) {
        Event event = eventService.GetEventById(eventId);
        return ResponseEntity.of(Optional.of(event != null ? event : HttpStatus.NOT_FOUND));
    }

    @PutMapping()
    public ResponseEntity<Object> PutEvent(@RequestBody Event updatedEvent) {
        Event event = eventService.UpdateEvent(updatedEvent);
        return ResponseEntity.of(Optional.of(event != null ? event : HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("{eventId}")
    public ResponseEntity<HttpStatus> DeleteEvent(@PathVariable Integer eventId) {
        return ResponseEntity.of(Optional.of(eventService.RemoveEventById(eventId) ? HttpStatus.OK : HttpStatus.NOT_FOUND));
    }

    @PostMapping("/attend")
    public  ResponseEntity<Object> AttendEvent(@RequestBody Attendance attendance) {
        Event event = attendanceService.handleAttendance(attendance);
        return ResponseEntity.of(Optional.of(event != null ? event : HttpStatus.NOT_FOUND));
    }

    @GetMapping("{eventId}/participants")
    public ResponseEntity<Object> GetParticipantsOfEnEvent(@PathVariable Integer eventId) {
        List<User> participants = eventService.GetParticipants(eventId);
        return ResponseEntity.of(Optional.of(participants != null? participants : HttpStatus.NOT_FOUND));
    }
}
