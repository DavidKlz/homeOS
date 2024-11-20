//
//  Generated code. Do not modify.
//  source: homeOS.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $1;
import 'homeOS.pb.dart' as $0;

export 'homeOS.pb.dart';

@$pb.GrpcServiceName('FileRPC')
class FileRPCClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.FileRequest, $0.File>(
      '/FileRPC/Get',
      ($0.FileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.File.fromBuffer(value));
  static final _$all = $grpc.ClientMethod<$1.Empty, $0.File>(
      '/FileRPC/All',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.File.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.FileRequest, $0.DefaultResponse>(
      '/FileRPC/Delete',
      ($0.FileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));
  static final _$sync = $grpc.ClientMethod<$1.Empty, $0.File>(
      '/FileRPC/Sync',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.File.fromBuffer(value));
  static final _$addMetaInfo = $grpc.ClientMethod<$0.MetaInfoToFile, $0.DefaultResponse>(
      '/FileRPC/AddMetaInfo',
      ($0.MetaInfoToFile value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));
  static final _$removeMetaInfo = $grpc.ClientMethod<$0.MetaInfoToFile, $0.DefaultResponse>(
      '/FileRPC/RemoveMetaInfo',
      ($0.MetaInfoToFile value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));

  FileRPCClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.File> get($0.FileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseStream<$0.File> all($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$all, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> delete($0.FileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseStream<$0.File> sync($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sync, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> addMetaInfo($0.MetaInfoToFile request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addMetaInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> removeMetaInfo($0.MetaInfoToFile request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeMetaInfo, request, options: options);
  }
}

@$pb.GrpcServiceName('FileRPC')
abstract class FileRPCServiceBase extends $grpc.Service {
  $core.String get $name => 'FileRPC';

  FileRPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FileRequest, $0.File>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileRequest.fromBuffer(value),
        ($0.File value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.File>(
        'All',
        all_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.File value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileRequest, $0.DefaultResponse>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileRequest.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.File>(
        'Sync',
        sync_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.File value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaInfoToFile, $0.DefaultResponse>(
        'AddMetaInfo',
        addMetaInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaInfoToFile.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaInfoToFile, $0.DefaultResponse>(
        'RemoveMetaInfo',
        removeMetaInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaInfoToFile.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.File> get_Pre($grpc.ServiceCall call, $async.Future<$0.FileRequest> request) async {
    return get(call, await request);
  }

  $async.Stream<$0.File> all_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* all(call, await request);
  }

  $async.Future<$0.DefaultResponse> delete_Pre($grpc.ServiceCall call, $async.Future<$0.FileRequest> request) async {
    return delete(call, await request);
  }

  $async.Stream<$0.File> sync_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* sync(call, await request);
  }

  $async.Future<$0.DefaultResponse> addMetaInfo_Pre($grpc.ServiceCall call, $async.Future<$0.MetaInfoToFile> request) async {
    return addMetaInfo(call, await request);
  }

  $async.Future<$0.DefaultResponse> removeMetaInfo_Pre($grpc.ServiceCall call, $async.Future<$0.MetaInfoToFile> request) async {
    return removeMetaInfo(call, await request);
  }

  $async.Future<$0.File> get($grpc.ServiceCall call, $0.FileRequest request);
  $async.Stream<$0.File> all($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.DefaultResponse> delete($grpc.ServiceCall call, $0.FileRequest request);
  $async.Stream<$0.File> sync($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.DefaultResponse> addMetaInfo($grpc.ServiceCall call, $0.MetaInfoToFile request);
  $async.Future<$0.DefaultResponse> removeMetaInfo($grpc.ServiceCall call, $0.MetaInfoToFile request);
}
@$pb.GrpcServiceName('MetaInfoRPC')
class MetaInfoRPCClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.MetaInfoRequest, $0.MetaInfo>(
      '/MetaInfoRPC/Get',
      ($0.MetaInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetaInfo.fromBuffer(value));
  static final _$all = $grpc.ClientMethod<$1.Empty, $0.MetaInfoMap>(
      '/MetaInfoRPC/All',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetaInfoMap.fromBuffer(value));
  static final _$allOf = $grpc.ClientMethod<$0.MetaType, $0.MetaInfoMap>(
      '/MetaInfoRPC/AllOf',
      ($0.MetaType value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetaInfoMap.fromBuffer(value));
  static final _$addType = $grpc.ClientMethod<$0.MetaType, $0.DefaultResponse>(
      '/MetaInfoRPC/AddType',
      ($0.MetaType value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));
  static final _$removeType = $grpc.ClientMethod<$0.MetaType, $0.DefaultResponse>(
      '/MetaInfoRPC/RemoveType',
      ($0.MetaType value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));
  static final _$allTypes = $grpc.ClientMethod<$1.Empty, $0.MetaType>(
      '/MetaInfoRPC/AllTypes',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetaType.fromBuffer(value));
  static final _$safe = $grpc.ClientMethod<$0.MetaInfo, $0.MetaInfo>(
      '/MetaInfoRPC/Safe',
      ($0.MetaInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetaInfo.fromBuffer(value));
  static final _$remove = $grpc.ClientMethod<$0.MetaInfoRequest, $0.DefaultResponse>(
      '/MetaInfoRPC/Remove',
      ($0.MetaInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DefaultResponse.fromBuffer(value));

  MetaInfoRPCClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.MetaInfo> get($0.MetaInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseStream<$0.MetaInfoMap> all($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$all, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.MetaInfoMap> allOf($0.MetaType request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$allOf, request, options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> addType($0.MetaType request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addType, request, options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> removeType($0.MetaType request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeType, request, options: options);
  }

  $grpc.ResponseStream<$0.MetaType> allTypes($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$allTypes, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.MetaInfo> safe($0.MetaInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$safe, request, options: options);
  }

  $grpc.ResponseFuture<$0.DefaultResponse> remove($0.MetaInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remove, request, options: options);
  }
}

@$pb.GrpcServiceName('MetaInfoRPC')
abstract class MetaInfoRPCServiceBase extends $grpc.Service {
  $core.String get $name => 'MetaInfoRPC';

  MetaInfoRPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MetaInfoRequest, $0.MetaInfo>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaInfoRequest.fromBuffer(value),
        ($0.MetaInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.MetaInfoMap>(
        'All',
        all_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.MetaInfoMap value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaType, $0.MetaInfoMap>(
        'AllOf',
        allOf_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaType.fromBuffer(value),
        ($0.MetaInfoMap value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaType, $0.DefaultResponse>(
        'AddType',
        addType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaType.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaType, $0.DefaultResponse>(
        'RemoveType',
        removeType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaType.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.MetaType>(
        'AllTypes',
        allTypes_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.MetaType value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaInfo, $0.MetaInfo>(
        'Safe',
        safe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaInfo.fromBuffer(value),
        ($0.MetaInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MetaInfoRequest, $0.DefaultResponse>(
        'Remove',
        remove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MetaInfoRequest.fromBuffer(value),
        ($0.DefaultResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.MetaInfo> get_Pre($grpc.ServiceCall call, $async.Future<$0.MetaInfoRequest> request) async {
    return get(call, await request);
  }

  $async.Stream<$0.MetaInfoMap> all_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* all(call, await request);
  }

  $async.Future<$0.MetaInfoMap> allOf_Pre($grpc.ServiceCall call, $async.Future<$0.MetaType> request) async {
    return allOf(call, await request);
  }

  $async.Future<$0.DefaultResponse> addType_Pre($grpc.ServiceCall call, $async.Future<$0.MetaType> request) async {
    return addType(call, await request);
  }

  $async.Future<$0.DefaultResponse> removeType_Pre($grpc.ServiceCall call, $async.Future<$0.MetaType> request) async {
    return removeType(call, await request);
  }

  $async.Stream<$0.MetaType> allTypes_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* allTypes(call, await request);
  }

  $async.Future<$0.MetaInfo> safe_Pre($grpc.ServiceCall call, $async.Future<$0.MetaInfo> request) async {
    return safe(call, await request);
  }

  $async.Future<$0.DefaultResponse> remove_Pre($grpc.ServiceCall call, $async.Future<$0.MetaInfoRequest> request) async {
    return remove(call, await request);
  }

  $async.Future<$0.MetaInfo> get($grpc.ServiceCall call, $0.MetaInfoRequest request);
  $async.Stream<$0.MetaInfoMap> all($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.MetaInfoMap> allOf($grpc.ServiceCall call, $0.MetaType request);
  $async.Future<$0.DefaultResponse> addType($grpc.ServiceCall call, $0.MetaType request);
  $async.Future<$0.DefaultResponse> removeType($grpc.ServiceCall call, $0.MetaType request);
  $async.Stream<$0.MetaType> allTypes($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.MetaInfo> safe($grpc.ServiceCall call, $0.MetaInfo request);
  $async.Future<$0.DefaultResponse> remove($grpc.ServiceCall call, $0.MetaInfoRequest request);
}
