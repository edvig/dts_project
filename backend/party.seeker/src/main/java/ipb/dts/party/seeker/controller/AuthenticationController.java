package ipb.dts.party.seeker.controller;

import ipb.dts.party.seeker.forms.LoginInput;
import ipb.dts.party.seeker.util.JwtTokenUtil;
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

    @Autowired
    public AuthenticationController(UserDetailsService userDetailsService, JwtTokenUtil jwtTokenUtil, AuthenticationManager authenticationManager) {
        this.userDetailsService = userDetailsService;
        this.jwtTokenUtil = jwtTokenUtil;
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/signin")
    public ResponseEntity<?> loginUser(@RequestBody LoginInput loginInput){
        try{
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginInput.username(), loginInput.password()));
            if(!authentication.isAuthenticated())
                throw new BadCredentialsException("");

            UserDetails userDetails = userDetailsService.loadUserByUsername(loginInput.username());
            String token = jwtTokenUtil.generateToken(userDetails);

            return ResponseEntity.ok(token);
        }catch (BadCredentialsException e){
            return ResponseEntity.status(401).body("Invalid Credentials");
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).body("Something went wrong");
        }
    }
}