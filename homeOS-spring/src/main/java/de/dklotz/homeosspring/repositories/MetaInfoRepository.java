package de.dklotz.homeosspring.repositories;

import de.dklotz.homeosspring.entities.MetaInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MetaInfoRepository extends JpaRepository<MetaInfo, Long> {
}
