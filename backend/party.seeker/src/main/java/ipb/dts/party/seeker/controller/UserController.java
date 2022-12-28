package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.model.Event;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.service.UserService;
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
    public ResponseEntity<User> PostUser(@RequestBody User newUser){
        return ResponseEntity.of(Optional.of(userService.CreateUser(newUser)));
    }

    @GetMapping("{userId}")
    public ResponseEntity<User> GetUser(@PathVariable Integer userId) {
        return ResponseEntity.of(Optional.of(userService.GetUserById(userId)));
    }

    @GetMapping()
    public ResponseEntity<List<User>> GetUsers() {
        return ResponseEntity.of(Optional.of(userService.GetUsers()));
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity DeleteUser(@PathVariable Integer userId) {
        return ResponseEntity.of(Optional.of(userService.DeleteUser(userId) ? HttpStatus.OK : HttpStatus.NOT_FOUND));
    }

    @PutMapping()
    public ResponseEntity<Object> PutUser(@RequestBody User updatedUser) {
        User user = userService.UpdateUser(updatedUser);
        return ResponseEntity.of(Optional.of(user != null ? HttpStatus.NOT_FOUND : user));
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
