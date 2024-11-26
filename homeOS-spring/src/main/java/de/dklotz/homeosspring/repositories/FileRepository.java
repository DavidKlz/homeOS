package de.dklotz.homeosspring.repositories;

import de.dklotz.homeosspring.entities.File;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileRepository extends JpaRepository<File, Long> {
    List<File> findAllByOrderByIdDesc();
}
