package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.service.EventService;
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

    @PostMapping()
    public ResponseEntity<Event> PostEvent(@RequestBody Event newEvent) {
        return ResponseEntity.of(Optional.of(eventService.CreateEvent(newEvent)));
    }

    @GetMapping()
    public ResponseEntity<List<Event>> GetEvents() {
        return ResponseEntity.of(Optional.of(eventService.GetAllEvents()));
    }

    @GetMapping("/{eventId}")
    public ResponseEntity<Event> GetEvent(@PathVariable Integer eventId) {
        return ResponseEntity.of(Optional.of(eventService.GetEventById(eventId)));
    }

    @PutMapping()
    public ResponseEntity<Object> PutEvent(@RequestBody Event updatedEvent) {
        Event event = eventService.UpdateEvent(updatedEvent);
        return ResponseEntity.of(Optional.of(event != null ? event : HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("{eventId}")
    public ResponseEntity DeleteEvent(@PathVariable Integer eventId) {
        return ResponseEntity.of(Optional.of(eventService.DeleteEventById(eventId) ? HttpStatus.OK : HttpStatus.NOT_FOUND));
    }


}
