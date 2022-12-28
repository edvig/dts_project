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
    public ResponseEntity<Object> PostUser(@RequestBody User newUser){
        UserView created = userService.CreateUser(newUser);
        return ResponseEntity.of(Optional.of(created != null? created : HttpStatus.CONFLICT));
    }

    @GetMapping("{userId}")
    public ResponseEntity<Object> GetUser(@PathVariable Integer userId) {
        UserView user = userService.GetUserViewById(userId);
        return ResponseEntity.of(Optional.of(user != null ? user : HttpStatus.NOT_FOUND));
    }

    @GetMapping()
    public ResponseEntity<List<UserView>> GetUsers() {
        return ResponseEntity.status(HttpStatus.OK).body(userService.GetUsers());
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity DeleteUser(@PathVariable Integer userId) {
        return ResponseEntity.of(Optional.of(userService.RemoveUserById(userId) ? HttpStatus.OK : HttpStatus.NOT_FOUND));
    }

    @PutMapping()
    public ResponseEntity<Object> PutUser(@RequestBody User updatedUser) {
        UserView updatedUserView = userService.UpdateUser(updatedUser);
        return ResponseEntity.of(Optional.of(updatedUserView != null ? updatedUserView : HttpStatus.NOT_FOUND));
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
