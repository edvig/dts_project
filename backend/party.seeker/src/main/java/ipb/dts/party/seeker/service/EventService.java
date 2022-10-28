package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EventService {
    @Autowired
    EventRepository eventRepository;

    public Event SaveEvent(Event newEvent) {
        return eventRepository.save(newEvent) ;
    }

    public List<Event> GetAllEvents() {
        return eventRepository.findAll();
    }

    public Event GetEventById(Integer eventId) {
        Optional<Event> optionalEvent = eventRepository.findById(eventId);
        return optionalEvent.isPresent() ? optionalEvent.get() : null;
    }

    public List<Event> GetUpcomingEvents() {
        return eventRepository.findAll()
                              .stream()
                              .filter(event -> event.getDate().isAfter(LocalDate.now().minusDays(1))).collect(Collectors.toList());
    }

    public boolean DeleteEventById(Integer eventId) {
        eventRepository.deleteById(eventId);
        return !eventRepository.existsById(eventId);
    }

    public Event UpdateEvent(Event updatedEvent) {
        Optional<Event> optionalEvent = eventRepository.findById(updatedEvent.getId());
        if (optionalEvent.isPresent()) {
            Event event = optionalEvent.get();
            event.setDate(updatedEvent.getDate());
            event.setPrice(updatedEvent.getPrice());
            event.setLocation(updatedEvent.getLocation());
            event.setTitle(updatedEvent.getTitle());
            event.setLimitOfAttendants(updatedEvent.getLimitOfAttendants());
            event.setMinAgeToAttend(updatedEvent.getMinAgeToAttend());
            event.setTimeOfStart(updatedEvent.getTimeOfStart());
            return eventRepository.save(event);
         }
        return null;
    }

    public List<User> GetParticipants(Integer eventId) {
        Event event = GetEventById(eventId);
        return (event != null) ? event.getParticipants() : null;
    }

}
