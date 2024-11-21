package de.dklotz.homeosspring.services;

import com.google.protobuf.Empty;
import de.dklotz.homeosspring.*;
import de.dklotz.homeosspring.config.ServerConfig;
import de.dklotz.homeosspring.entities.File;
import de.dklotz.homeosspring.entities.MimeType;
import de.dklotz.homeosspring.repositories.FileRepository;
import de.dklotz.homeosspring.repositories.MetaInfoRepository;
import io.grpc.stub.StreamObserver;
import jakarta.annotation.PostConstruct;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;
import net.devh.boot.grpc.server.service.GrpcService;
import org.jetbrains.annotations.NotNull;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;

@GrpcService
public class FileService extends FileRPCGrpc.FileRPCImplBase {

    private final FileRepository fileRepository;
    private final ServerConfig serverConfig;
    private final MetaInfoRepository metaInfoRepository;

    FileService(FileRepository fileRepository, ServerConfig serverConfig, MetaInfoRepository metaInfoRepository) {
        this.fileRepository = fileRepository;
        this.serverConfig = serverConfig;
        this.metaInfoRepository = metaInfoRepository;
    }

    @Override
    public void get(FileRequest request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        var file = fileRepository.findById(request.getId());
        file.ifPresent(value -> responseObserver.onNext(fileEntityToRpcFile(value)));
        responseObserver.onCompleted();
    }

    private Map<String, List<MetaInfoValue>> mapOfMetaInfos(@NotNull File value) {
        Map<String, List<MetaInfoValue>> metaInfosAsMap = new HashMap<>();
        for (var meta : value.getMetaInfos()) {
            metaInfosAsMap.compute(meta.getType().getName(), (s, strings) -> {
                if (strings == null) {
                    strings = new ArrayList<>();
                }
                strings.add(MetaInfoValue.newBuilder().setValue(meta.getTag()).setId(meta.getId()).build());
                return strings;
            });
        }
        return metaInfosAsMap;
    }

    @Override
    public void all(Empty request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        fileRepository.findAll().reversed().forEach(file -> {
            responseObserver.onNext(fileEntityToRpcFile(file));
        });
        responseObserver.onCompleted();
    }

    @Override
    public void delete(FileRequest request, StreamObserver<DefaultResponse> responseObserver) {
        var file = fileRepository.findById(request.getId());

        if (file.isPresent()) {
            try {
                Files.delete(Path.of(file.get().getThumbPath()));
                Files.delete(Path.of(file.get().getPath()));
                fileRepository.deleteById(request.getId());
                responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(true).build());
            } catch (IOException e) {
                responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(false).setMessage(e.getMessage()).build());
            }
        } else {
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(false).setMessage("No File found for ID " + request.getId()).build());
        }

        responseObserver.onCompleted();
    }

    @Override
    public void sync(Empty request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        var dir = new java.io.File(getSyncPath());
        var files = Arrays.stream(Objects.requireNonNull(dir.listFiles())).filter(java.io.File::isFile);
        int i = 1;
        files.forEach(file -> {
            var extension = file.getName().substring(file.getName().lastIndexOf(".") + 1);
            try (FileInputStream inStream = new FileInputStream(file)) {
                var saved = storeFile(extension, i, inStream);
                responseObserver.onNext(fileEntityToRpcFile(saved));
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                if (!file.delete()) {
                    System.err.println("Could not delete file " + file.getName());
                }
            }
        });
        responseObserver.onCompleted();
    }

    private File storeFile(final String extension, final int count, final InputStream inStream) throws Exception {
        var contentType = MimeType.Companion.getMimeType(extension);
        if (contentType == null) {
            throw new Exception("Unknown extension " + extension);
        }
        var filename = "FILE_" + count + "u" + UUID.randomUUID();
        var outFilename = filename + "." + extension;
        var outPath = getPath(contentType) + "/" + outFilename;

        var thumbFilename = filename + ".jpg";
        var thumbPath = getThumbnailPath(contentType) + "/" + thumbFilename;

        Files.write(Path.of(outPath), inStream.readAllBytes());

        createImageThumb(outPath, thumbPath, contentType.isVideo());

        return fileRepository.save(
                new File(
                        -1,
                        filename,
                        outPath,
                        thumbPath,
                        contentType,
                        false,
                        Collections.emptySet()
                )
        );
    }

    private void createImageThumb(final String outPath, final String thumbPath, final boolean video) throws IOException {
        var ffmpeg = new FFmpeg("C:\\tools\\ffmpeg\\ffmpeg.exe");
        var ffprobe = new FFprobe("C:\\tools\\ffmpeg\\ffprobe.exe");
        FFmpegBuilder builder;

        var inProbe = ffprobe.probe(outPath);
        var stream = inProbe.getStreams().getFirst();
        var thumbWidth = 360;
        double thumbHeight = ((double) stream.height / stream.width) * thumbWidth;

        if (video) {
            var duration = inProbe.getFormat().duration / 2;
            builder = new FFmpegBuilder()
                    .setInput(outPath)
                    .addOutput(thumbPath)
                    .setVideoResolution(thumbWidth, (int) thumbHeight)
                    .setFrames(1)
                    .setStartOffset(Math.round(duration), TimeUnit.SECONDS)
                    .done();
        } else {
            builder = new FFmpegBuilder()
                    .setInput(outPath)
                    .addOutput(thumbPath)
                    .setVideoResolution(thumbWidth, (int) thumbHeight)
                    .setFrames(1)
                    .done();
        }

        var executor = new FFmpegExecutor(ffmpeg, ffprobe);
        executor.createJob(builder).run();
    }

    @Override
    public void addMetaInfo(MetaInfoToFile request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        var oFile = fileRepository.findById(request.getFileId());
        var metaInfo = metaInfoRepository.findById(request.getMetaInfoId());

        try {
            if (oFile.isPresent() && metaInfo.isPresent()) {
                var file = oFile.get();
                var metaInfos = file.getMetaInfos();
                metaInfos.add(metaInfo.get());
                file.setMetaInfos(metaInfos);
                responseObserver.onNext(fileEntityToRpcFile(fileRepository.save(file)));
            }
        } catch (Exception e) {
            responseObserver.onError(e);
        }

        responseObserver.onCompleted();
    }

    @Override
    public void removeMetaInfo(MetaInfoToFile request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        var oFile = fileRepository.findById(request.getFileId());
        var metaInfo = metaInfoRepository.findById(request.getMetaInfoId());

        try {
            if (oFile.isPresent() && metaInfo.isPresent()) {
                var file = oFile.get();
                file.getMetaInfos().remove(metaInfo.get());
                responseObserver.onNext(fileEntityToRpcFile(fileRepository.save(file)));
            }
        } catch (Exception e) {
            responseObserver.onError(e);
        }

        responseObserver.onCompleted();
    }

    @Override
    public void setFavorite(FileRequest request, StreamObserver<de.dklotz.homeosspring.File> responseObserver) {
        var oFile = fileRepository.findById(request.getId());
        try {
            if (oFile.isPresent()) {
                var file = oFile.get();
                file.setFavorite(request.getFavorite());
                responseObserver.onNext(fileEntityToRpcFile(fileRepository.save(file)));
            }
        } catch (Exception e) {
            responseObserver.onError(e);
        }
        responseObserver.onCompleted();
    }

    public java.io.File getFile(final Long id) {
        return fileRepository.findById(id).map(file -> Path.of(file.getPath()).toFile()).orElse(null);
    }

    public java.io.File getThumbnail(final Long id) {
        return fileRepository.findById(id).map(file -> Path.of(file.getThumbPath()).toFile()).orElse(null);
    }

    public MimeType getMimeType(final Long id) {
        return fileRepository.findById(id).map(File::getMimeType).orElse(null);
    }

    @PostConstruct
    void createFolders() throws IOException {
        Files.createDirectories(Paths.get(getSyncPath()));
        Files.createDirectories(Paths.get(getThumbnailPath(MimeType.IMAGE_JPEG)));
        Files.createDirectories(Paths.get(getThumbnailPath(MimeType.VIDEO_MP4)));
        Files.createDirectories(Paths.get(getThumbnailPath(MimeType.IMAGE_GIF)));
    }

    private String getSyncPath() {
        return serverConfig.getRoot() + "/Sync";
    }

    private String getPath(final MimeType mime) {
        return serverConfig.getRoot() + "/Server/" + mime.getFolderName();
    }

    private String getThumbnailPath(final MimeType mime) {
        return getPath(mime) + "/thumbnail";
    }

    private de.dklotz.homeosspring.File fileEntityToRpcFile(final File saved) {
        var fileBuilder = de.dklotz.homeosspring.File.newBuilder()
                .setId(saved.getId())
                .setName(saved.getName())
                .setFavorite(saved.isFavorite())
                .setMime(saved.getMimeType().getType())
                .setIsVideo(saved.getMimeType().isVideo());

        Map<String, List<MetaInfoValue>> metaInfosAsMap = mapOfMetaInfos(saved);

        for (var metaEntry : metaInfosAsMap.entrySet()) {
            fileBuilder.addMetaInfos(MetaInfoMap.newBuilder().setKey(metaEntry.getKey()).addAllValue(metaEntry.getValue()).build());
        }

        return fileBuilder.build();
    }
}
