package de.dklotz.homeosspring.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Entity
@Table(name = "file")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class File {
    private @Id
    @GeneratedValue long id;
    private String name;
    private String path;
    private String thumbPath;
    @Enumerated(EnumType.STRING)
    private MimeType mimeType;
    private boolean favorite;
    @ManyToMany(fetch = FetchType.EAGER)
    private Set<MetaInfo> metaInfos;
}
