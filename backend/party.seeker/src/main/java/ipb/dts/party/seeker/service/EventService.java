package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EventService {
    @Autowired
    EventRepository eventRepository;

    public Event CreateEvent(Event newEvent, User organizer) {
        if (organizer == null) return null;

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

    public List<Event> GetAllEvents() {
        return eventRepository.findAll();
    }

    public Event GetEventById(Integer eventId) {
        Optional<Event> optionalEvent = eventRepository.findById(eventId);
        System.out.println("Db:"+optionalEvent.get().getParticipants().stream().count());
        return optionalEvent.isPresent() ? optionalEvent.get() : null;
    }

    public List<Event> GetUpcomingEvents() {
        return eventRepository.findAll()
                              .stream()
                              .filter(event -> event.getDate().isAfter(LocalDate.now().minusDays(1))).collect(Collectors.toList());
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
        event.getParticipants().forEach(participant->{
            List<Event> participationList = participant.getEvents();
            participationList.remove(event);
            participant.setEvents(participationList);
        });
        List<Event> eventsOfOrganizer = event.getOrganizer().getMyEvents();
        eventsOfOrganizer.remove(event);
        event.getOrganizer().setMyEvents(eventsOfOrganizer);

        event.getParticipants().clear();

        return DeleteEventById(event.getId());
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
