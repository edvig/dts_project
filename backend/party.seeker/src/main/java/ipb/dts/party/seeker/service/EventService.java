package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.EventRepository;
import ipb.dts.party.seeker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EventService {
    @Autowired
    EventRepository eventRepository;

    @Autowired
    UserRepository userRepository;

    public Event CreateEvent(Event newEvent, User organizer) {
        if (organizer == null) return null;

        if(!newEvent.getDateTime().isEmpty()){
            newEvent.setDateAndTime(newEvent.getDateTime());
        }

        List<Event> events = organizer.getMyEvents();
        newEvent.setOrganizer(organizer);
        events.add(newEvent);
        organizer.setMyEvents(events);

        List<User> updatedParticipants = newEvent.getParticipants();
        updatedParticipants.add(organizer);
        newEvent.setParticipants(updatedParticipants);

        List<Event> updatedParticipations = organizer.getEvents();
        updatedParticipations.add(newEvent);
        organizer.setEvents(updatedParticipations);

        Event savedEvent = SaveEvent(newEvent);
        return savedEvent;
    }

    public Event SaveEvent(Event newEvent) {
        return eventRepository.save(newEvent) ;
    }

    public User SaveUser(User user) {
        return userRepository.save(user) ;
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
                              .filter(event -> event.getDateAndTime().isAfter(LocalDateTime.now().minusDays(1))).collect(Collectors.toList());
    }

    public boolean DeleteEventById2(Integer eventId) {
        Event event = GetEventById(eventId);
        if (event == null) return false;
        event.getParticipants().forEach(participant-> {
            participant.getMyEvents().remove(event);

        });

        event.setParticipants(null);
        eventRepository.deleteById(eventId);
        return !eventRepository.existsById(eventId);
    }

    public boolean DeleteEventById(Integer eventId) {
        eventRepository.deleteById(eventId);
        return GetEventById(eventId) == null;
    }

    public boolean RemoveEventById(Integer eventId) {
        Event event = GetEventById(eventId);
        if (event == null) return false;
        User organizer = event.getOrganizer();
        organizer.removeOrganizedEventById(eventId);
        event.setOrganizer(null);
        event.setOrganizerId(null);

        List<User> participants = event.getParticipants();
        participants.forEach(participant -> {
            participant.removeAttendedEventById(eventId);
            SaveUser(participant);
        });
        participants.clear();

        SaveUser(organizer);
        SaveEvent(event);

        return DeleteEventById(event.getId());
    }

    public Event UpdateEvent(Event updatedEvent) {
        Optional<Event> optionalEvent = eventRepository.findById(updatedEvent.getId());
        if (optionalEvent.isPresent()) {
            Event event = optionalEvent.get();
            event.setPrice(updatedEvent.getPrice() != null ? updatedEvent.getPrice() : event.getPrice());
            event.setLocation(updatedEvent.getLocation() != null ? updatedEvent.getLocation() : event.getLocation());
            event.setTitle(updatedEvent.getTitle() != null ? updatedEvent.getTitle() : event.getTitle());
            event.setLimitOfAttendants(updatedEvent.getLimitOfAttendants() != null ? updatedEvent.getLimitOfAttendants() : event.getLimitOfAttendants());
            event.setMinAgeToAttend(updatedEvent.getMinAgeToAttend() != null ? updatedEvent.getMinAgeToAttend() : event.getMinAgeToAttend());
            event.setDateAndTime(!updatedEvent.getDateTime().isEmpty() ? updatedEvent.getDateTime() : event.getDateTime());
            return eventRepository.save(event);
         }
        return null;
    }

    public List<User> GetParticipants(Integer eventId) {
        Event event = GetEventById(eventId);
        return (event != null) ? event.getParticipants() : null;
    }

}
