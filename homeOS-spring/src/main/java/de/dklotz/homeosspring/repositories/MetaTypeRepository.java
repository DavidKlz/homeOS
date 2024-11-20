package de.dklotz.homeosspring.repositories;

import de.dklotz.homeosspring.entities.MetaType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MetaTypeRepository extends JpaRepository<MetaType, String> {
}
