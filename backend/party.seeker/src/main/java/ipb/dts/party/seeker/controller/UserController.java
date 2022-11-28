package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.service.UserService;
import ipb.dts.party.seeker.view.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("users")
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping()
    public ResponseEntity<UserView> PostUser(@RequestBody User newUser){
        User created = Optional.of(userService.CreateUser(newUser)).get();
        UserView user = new UserView(
                created.getId(),
                created.getFirstName(),
                created.getLastName(),
                created.getEmailAddress(),
                created.getUsername(),
                created.getBirthDay()
        );

        return ResponseEntity.status(HttpStatus.CREATED).body(user);
    }

    @GetMapping("{userId}")
    public ResponseEntity<UserView> GetUser(@PathVariable Integer userId) {
        User found = Optional.of(userService.GetUserById(userId)).get();
        UserView user = new UserView(
                found.getId(),
                found.getFirstName(),
                found.getLastName(),
                found.getEmailAddress(),
                found.getUsername(),
                found.getBirthDay()
        );

        return ResponseEntity.status(HttpStatus.OK).body(user);
    }

    @GetMapping()
    public ResponseEntity<List<UserView>> GetUsers() {
        List<UserView> users = userService.GetUsers().stream().map(user -> new UserView(user.getId(), user.getFirstName(), user.getLastName(), user.getEmailAddress(), user.getUsername(), user.getBirthDay())).toList();
        return ResponseEntity.status(HttpStatus.OK).body(users);
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity DeleteUser(@PathVariable Integer userId) {
        return ResponseEntity.of(Optional.of(userService.DeleteUser(userId) ? HttpStatus.OK : HttpStatus.NOT_FOUND));
    }

    @PutMapping()
    public ResponseEntity<Object> PutUser(@RequestBody User updatedUser) {
        Optional<User> found = Optional.of(userService.UpdateUser(updatedUser));
        if(found.isPresent()){
            UserView user = new UserView(
                    found.get().getId(),
                    found.get().getFirstName(),
                    found.get().getLastName(),
                    found.get().getEmailAddress(),
                    found.get().getUsername(),
                    found.get().getBirthDay()
            );
            return ResponseEntity.status(HttpStatus.OK).body(user);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    @GetMapping("/{userId}/myevents")
    public ResponseEntity<Object> GetEventsOrganizedByUser(@PathVariable Integer userId) {
        List<Event> events = userService.GetEventsOrganizedByUser(userId);
        return ResponseEntity.of(Optional.of(events != null ? events : HttpStatus.NOT_FOUND));
    }

    @GetMapping("/{userId}/participations")
    public ResponseEntity<Object> GetEventUserParticipate(@PathVariable Integer userId) {
        List<Event> participations = userService.GetParticipationsByUser(userId);
        return ResponseEntity.of(Optional.of(participations != null ? participations : HttpStatus.NOT_FOUND));
    }


}
