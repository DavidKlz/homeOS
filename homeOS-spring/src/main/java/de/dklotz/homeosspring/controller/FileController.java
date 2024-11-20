package de.dklotz.homeosspring.controller;

import de.dklotz.homeosspring.entities.MimeType;
import de.dklotz.homeosspring.services.FileService;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.FileInputStream;
import java.io.IOException;

@RestController
@RequestMapping("/api/file")
public class FileController {

    private final FileService service;

    public FileController(FileService fileService) {
        service = fileService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<InputStreamResource> serveFile(@PathVariable Long id) throws IOException {
        return serve(service.getFile(id), service.getMimeType(id));
    }

    @GetMapping("/thumb/{id}")
    public ResponseEntity<InputStreamResource> serveThumbnail(@PathVariable Long id) throws IOException {
        return serve(service.getThumbnail(id), service.getMimeType(id));
    }

    private ResponseEntity<InputStreamResource> serve(final java.io.File file, final MimeType mime) throws IOException {
        if(file != null && mime != null) {
            var headers = new HttpHeaders();
            headers.add("Content-Type", mime.getType());
            return ResponseEntity.ok().headers(headers).body(new InputStreamResource(new FileInputStream(file)));
        }
        return ResponseEntity.notFound().build();
    }
}
