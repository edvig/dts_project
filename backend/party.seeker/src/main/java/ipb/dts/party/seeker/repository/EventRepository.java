package ipb.dts.party.seeker.repository;

import ipb.dts.party.seeker.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Integer> {
}
