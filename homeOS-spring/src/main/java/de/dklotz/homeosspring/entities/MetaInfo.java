package de.dklotz.homeosspring.entities;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.Set;

@Entity
@Table(
        name = "meta_info",
        uniqueConstraints = {
            @UniqueConstraint(name = "meta_index", columnNames = {"type_name", "tag"})
})
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class MetaInfo {
    private @Id
    @GeneratedValue long id;
    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private MetaType type;
    private String tag;
    @ManyToMany(fetch = FetchType.EAGER)
    private Set<File> files;
}
