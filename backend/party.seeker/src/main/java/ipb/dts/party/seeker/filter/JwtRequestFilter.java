package ipb.dts.party.seeker.filter;

import ipb.dts.party.seeker.service.CustomUserDetailService;
import ipb.dts.party.seeker.util.JwtTokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {
    private CustomUserDetailService customUserDetailService;
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    public JwtRequestFilter(CustomUserDetailService customUserDetailService, JwtTokenUtil jwtTokenUtil) {
        this.customUserDetailService = customUserDetailService;
        this.jwtTokenUtil = jwtTokenUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            String token = extractTokenFrom(request.getHeader("Authorization"));
            String username = getUsernameFrom(token);
            UserDetails userDetails = customUserDetailService.loadUserByUsername(username);

            if(jwtTokenUtil.validateToken(token, userDetails))
                setAuthentication(userDetails, request);

        } catch (Exception e) {
            response.setStatus(401);
        }

        filterChain.doFilter(request, response);
    }

    private String extractTokenFrom(String token)
            throws Exception {
        if(!StringUtils.startsWith(token, "Bearer "))
            throw new Exception("Invalid Token");
        return token.substring(7);
    }

    private String getUsernameFrom(String token)
            throws Exception{
        String username = jwtTokenUtil.getUsernameFromToken(token);
        if(StringUtils.isEmpty(username) && null == SecurityContextHolder.getContext().getAuthentication())
            throw new Exception("Invalid Token");
        return username;
    }

    private void setAuthentication(UserDetails user, HttpServletRequest request){
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
        usernamePasswordAuthenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
    }
}