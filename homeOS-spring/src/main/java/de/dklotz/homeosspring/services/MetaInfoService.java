package de.dklotz.homeosspring.services;

import com.google.protobuf.Empty;
import de.dklotz.homeosspring.*;
import de.dklotz.homeosspring.repositories.MetaInfoRepository;
import de.dklotz.homeosspring.repositories.MetaTypeRepository;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.Collections;

@GrpcService
public class MetaInfoService extends MetaInfoRPCGrpc.MetaInfoRPCImplBase {

    private final MetaInfoRepository metaInfoRepository;

    private final MetaTypeRepository metaTypeRepository;

    public MetaInfoService(final MetaInfoRepository metaInfoRepository, final MetaTypeRepository metaTypeRepository) {
        this.metaInfoRepository = metaInfoRepository;
        this.metaTypeRepository = metaTypeRepository;
    }

    @Override
    public void get(MetaInfoRequest request, StreamObserver<MetaInfo> responseObserver) {
        metaInfoRepository
                .findById(request.getId())
                .ifPresent(metaInfo -> responseObserver.onNext(MetaInfo.newBuilder()
                        .setId(metaInfo.getId())
                        .setKey(metaInfo.getType().getName())
                        .setValue(metaInfo.getTag())
                        .build()));
        responseObserver.onCompleted();
    }

    @Override
    public void all(Empty request, StreamObserver<MetaInfoMap> responseObserver) {
        metaTypeRepository
                .findAll()
                .forEach(metaType -> responseObserver.onNext(
                        MetaInfoMap.newBuilder()
                                .setKey(metaType.getName())
                                .addAllValue(metaType.getMetaInfos()
                                        .stream()
                                        .map(metaInfo -> MetaInfoValue.newBuilder()
                                                .setId(metaInfo.getId())
                                                .setValue(metaInfo.getTag())
                                                .build())
                                        .toList())
                                .build()));
        responseObserver.onCompleted();
    }

    @Override
    public void allOf(MetaType request, StreamObserver<MetaInfoMap> responseObserver) {
        metaTypeRepository
                .findById(request.getType())
                .ifPresent(type -> responseObserver.onNext(
                        MetaInfoMap.newBuilder()
                                .setKey(type.getName())
                                .addAllValue(type.getMetaInfos()
                                        .stream()
                                        .map(metaInfo -> MetaInfoValue.newBuilder()
                                                .setId(metaInfo.getId())
                                                .setValue(metaInfo.getTag())
                                                .build())
                                        .toList())
                                .build()));
        responseObserver.onCompleted();
    }


    @Override
    public void addType(MetaType request, StreamObserver<DefaultResponse> responseObserver) {
        if (metaTypeRepository.findById(request.getType()).isEmpty()) {
            metaTypeRepository.save(new de.dklotz.homeosspring.entities.MetaType(request.getType(), Collections.emptyList()));
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(true).build());
        } else {
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(false).setMessage("Type already exists").build());
        }
        responseObserver.onCompleted();
    }

    @Override
    public void removeType(MetaType request, StreamObserver<DefaultResponse> responseObserver) {
        try {
            metaTypeRepository.deleteById(request.getType());
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(true).build());
        } catch (Exception e) {
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(false).setMessage(e.getMessage()).build());
        } finally {
            responseObserver.onCompleted();
        }
    }

    @Override
    public void allTypes(Empty request, StreamObserver<MetaType> responseObserver) {
        metaTypeRepository.findAll().forEach(metaType -> responseObserver.onNext(MetaType.newBuilder().setType(metaType.getName()).build()));
        responseObserver.onCompleted();
    }

    @Override
    public void safe(MetaInfo request, StreamObserver<MetaInfo> responseObserver) {
        try {
            var entity = new de.dklotz.homeosspring.entities.MetaInfo();

            var type = metaTypeRepository.findById(request.getKey()).orElse(metaTypeRepository.save(new de.dklotz.homeosspring.entities.MetaType(request.getKey(), Collections.emptyList())));

            entity.setType(type);
            entity.setTag(request.getValue());
            entity.setFiles(Collections.emptySet());

            var saved = metaInfoRepository.save(entity);

            var metaInfos = type.getMetaInfos();
            metaInfos.add(saved);
            type.setMetaInfos(metaInfos);
            metaTypeRepository.save(type);

            responseObserver.onNext(MetaInfo.newBuilder().setId(saved.getId()).setKey(saved.getType().getName()).setValue(saved.getTag()).build());
        } catch (Exception e) {
            responseObserver.onError(e);
        } finally {
            responseObserver.onCompleted();
        }
    }

    @Override
    public void remove(MetaInfoRequest request, StreamObserver<DefaultResponse> responseObserver) {
        try {
            metaInfoRepository.deleteById(request.getId());
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(true).build());
        } catch (Exception e) {
            responseObserver.onNext(DefaultResponse.newBuilder().setSuccess(false).setMessage(e.getMessage()).build());
        } finally {
            responseObserver.onCompleted();
        }
    }
}
