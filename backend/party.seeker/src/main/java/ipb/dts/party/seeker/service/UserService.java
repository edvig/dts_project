package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    EventService eventService;

    public List<User> GetUsers() {
        return userRepository.findAll();
    }

    public User GetUserById(Integer userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        return optionalUser.isPresent() ? optionalUser.get() : null;
    }

    public User SaveUser(User user){
        return userRepository.save(user);
    }

    public User CreateUser(User user) {
        user.setEvents(new ArrayList<Event>());
        user.setMyEvents(new ArrayList<Event>());
        return SaveUser(user);
    }

    public boolean DeleteUser(Integer userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if(!optionalUser.isPresent())
            return false;
        User user = optionalUser.get();

        user.getEvents().forEach(event -> {
            event.getParticipants().remove(user);
            eventService.SaveEvent(event);
        });

        user.getMyEvents().forEach(myEvent->{
            eventService.RemoveEventById(myEvent.getId());
        });

        user.setEvents(null);
        user.setMyEvents(null);
        userRepository.deleteById(userId);

        return true;
    }

    public User UpdateUser(User updatedUser) {
        Optional<User> optionalUser = userRepository.findById(updatedUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setAge(updatedUser.getAge());
            user.setPassword(updatedUser.getPassword());
            user.setUsername(updatedUser.getUsername());
            user.setFirstName(updatedUser.getFirstName());
            user.setLastName(updatedUser.getLastName());
            user.setEmailAddress(updatedUser.getEmailAddress());
            return userRepository.save(user);
        }
        return null;
    }

    public List<Event> GetEventsOrganizedByUser(Integer userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if(!optionalUser.isPresent())
            return null;
        return GetUserById(userId).getMyEvents();
    }

    public List<Event> GetParticipationsByUser(Integer userId) {
        User optionalUser = GetUserById(userId);
        if(optionalUser == null)
            return null;
        return GetUserById(userId).getEvents();
    }

    public Event setUserForNewEvent(Event newEvent) {
        User organizer = GetUserById(newEvent.getOrganizerId());
        if (organizer == null) return null;
        Event createdEvent = eventService.CreateEvent(newEvent, organizer);
        SaveUser(organizer);
        return createdEvent;
    }
}
