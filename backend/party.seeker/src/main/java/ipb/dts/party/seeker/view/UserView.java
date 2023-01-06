package ipb.dts.party.seeker.view;

import java.time.LocalDateTime;
import java.util.Date;

public record UserView(
        int id,
        String firstName,
        String lastName,
        String emailAddress,
        String username,
        String birthday
) { }