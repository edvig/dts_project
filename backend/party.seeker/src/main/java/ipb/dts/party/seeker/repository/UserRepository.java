package ipb.dts.party.seeker.repository;

import ipb.dts.party.seeker.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
