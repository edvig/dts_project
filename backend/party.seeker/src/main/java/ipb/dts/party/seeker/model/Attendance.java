package ipb.dts.party.seeker.model;

import lombok.Data;

@Data
public class Attendance {

    private Integer eventId;

    private Integer userId;

    private boolean attend;
}

