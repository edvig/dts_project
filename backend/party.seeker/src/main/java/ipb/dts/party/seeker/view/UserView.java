package ipb.dts.party.seeker.view;

import java.util.Date;

public record UserView(
        int id,
        String firstName,
        String lastName,
        String emailAddress,
        String username,
        Date birthday
) { }