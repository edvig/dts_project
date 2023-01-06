package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.UserRepository;
import ipb.dts.party.seeker.view.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    EventService eventService;

    public List<UserView> GetUsers() {
        return userRepository.findAll().stream().map(user -> UserViewFromUser(user)).collect(Collectors.toList());
    }

    public User GetUserById(Integer userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        return optionalUser.orElse(null);
    }

    public UserView GetUserViewById(Integer userId) {
        User user = GetUserById(userId);
        if (user == null) return null;
        return UserViewFromUser(user);
    }

    public User GetUserByUsername(String username){
        Optional<User> optionalUser = userRepository.findByUsername(username);
        return optionalUser.orElse(null);
    }

    public User SaveUser(User user){
        return userRepository.save(user);
    }

    public UserView CreateUser(User user) {
        user.setEvents(new ArrayList<Event>());
        user.setMyEvents(new ArrayList<Event>());
        user.setPassword(encode(user.getPassword()));
        if(!user.getBirthday().isEmpty())
            user.setBirthdayDate(user.getBirthday());
        return UserViewFromUser(SaveUser(user));
    }

    private UserView UserViewFromUser(User user) {
        return new UserView(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmailAddress(),
                user.getUsername(),
                user.getBirthday()
        );
    }

    public boolean DeleteUserById(Integer userId) {
        userRepository.deleteById(userId);
        return GetUserById(userId) == null;
    }

    public UserView UpdateUser(User updatedUser) {
        Optional<User> optionalUser = userRepository.findById(updatedUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setBirthdayDate(updatedUser.getBirthday() != null ? updatedUser.getBirthday() : user.getBirthday());
            user.setPassword(updatedUser.getPassword() != null ? encode(updatedUser.getPassword()) : user.getPassword());
            user.setUsername(updatedUser.getUsername() != null ? updatedUser.getUsername() : user.getUsername());
            user.setFirstName(updatedUser.getFirstName() != null ? updatedUser.getFirstName() : user.getFirstName());
            user.setLastName(updatedUser.getLastName() != null ? updatedUser.getLastName() : user.getLastName());
            user.setEmailAddress(updatedUser.getEmailAddress() != null ? updatedUser.getEmailAddress() : user.getEmailAddress());
            return UserViewFromUser(userRepository.save(user));
        }
        return null;
    }

    public List<Event> GetEventsOrganizedByUser(Integer userId) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if(optionalUser.isEmpty())
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

    public boolean RemoveUserById(Integer userId) {
        User user = GetUserById(userId);
        if(user==null) return false;
        List<Event> eventsOrganizedByUser = user.getMyEvents();
        int numOfEventsToRemove = eventsOrganizedByUser.size();
        for(int i = 0; i < numOfEventsToRemove; i++) {
            eventService.RemoveEventById(eventsOrganizedByUser.get(0).getId());
        }

        return DeleteUserById(userId);
    }

    private String encode(String password){
        return new BCryptPasswordEncoder().encode(password);
    }
}
