package ipb.dts.party.seeker.service;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

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

    public boolean DeleteUser(Integer userId) {
        userRepository.deleteById(userId);
        return !userRepository.existsById(userId);
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
        return GetUserById(userId).getMyEvents();
    }
}
