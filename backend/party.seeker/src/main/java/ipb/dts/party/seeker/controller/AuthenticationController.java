package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.forms.LoginInput;
import ipb.dts.party.seeker.model.User;
import ipb.dts.party.seeker.service.UserService;
import ipb.dts.party.seeker.util.JwtTokenUtil;
import ipb.dts.party.seeker.view.LoginView;
import ipb.dts.party.seeker.view.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthenticationController {
    private UserDetailsService userDetailsService;
    private JwtTokenUtil jwtTokenUtil;
    private AuthenticationManager authenticationManager;

    private UserService userService;

    @Autowired
    public AuthenticationController(UserDetailsService userDetailsService, JwtTokenUtil jwtTokenUtil, AuthenticationManager authenticationManager, UserService service) {
        this.userDetailsService = userDetailsService;
        this.jwtTokenUtil = jwtTokenUtil;
        this.authenticationManager = authenticationManager;
        this.userService = service;
    }

    @PostMapping("/signin")
    public ResponseEntity<?> loginUser(@RequestBody LoginInput loginInput){
        try{
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginInput.username(), loginInput.password()));
            if(!authentication.isAuthenticated())
                throw new BadCredentialsException("");

            UserDetails userDetails = userDetailsService.loadUserByUsername(loginInput.username());

            String token = jwtTokenUtil.generateToken(userDetails);
            UserView userView = loadUserViewByUsername(loginInput.username());

            LoginView login = new LoginView(token, userView);
            return ResponseEntity.ok(login);
        }catch (BadCredentialsException e){
            return ResponseEntity.status(401).body("Invalid Credentials");
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).body("Something went wrong");
        }
    }

    private UserView loadUserViewByUsername(String username){
        User user = userService.GetUserByUsername(username);
        UserView userView = new UserView(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmailAddress(),
                user.getUsername(),
                user.getBirthDay()
        );

        return userView;
    }
}