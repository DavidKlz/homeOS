//
//  Generated code. Do not modify.
//  source: homeOS.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class DefaultResponse extends $pb.GeneratedMessage {
  factory DefaultResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  DefaultResponse._() : super();
  factory DefaultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DefaultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DefaultResponse', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DefaultResponse clone() => DefaultResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DefaultResponse copyWith(void Function(DefaultResponse) updates) => super.copyWith((message) => updates(message as DefaultResponse)) as DefaultResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DefaultResponse create() => DefaultResponse._();
  DefaultResponse createEmptyInstance() => create();
  static $pb.PbList<DefaultResponse> createRepeated() => $pb.PbList<DefaultResponse>();
  @$core.pragma('dart2js:noInline')
  static DefaultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DefaultResponse>(create);
  static DefaultResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class File extends $pb.GeneratedMessage {
  factory File({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? mime,
    $core.bool? favorite,
    $core.bool? isVideo,
    $core.Iterable<MetaInfoMap>? metaInfos,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (mime != null) {
      $result.mime = mime;
    }
    if (favorite != null) {
      $result.favorite = favorite;
    }
    if (isVideo != null) {
      $result.isVideo = isVideo;
    }
    if (metaInfos != null) {
      $result.metaInfos.addAll(metaInfos);
    }
    return $result;
  }
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'File', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'mime')
    ..aOB(4, _omitFieldNames ? '' : 'favorite')
    ..aOB(5, _omitFieldNames ? '' : 'isVideo', protoName: 'isVideo')
    ..pc<MetaInfoMap>(6, _omitFieldNames ? '' : 'metaInfos', $pb.PbFieldType.PM, protoName: 'metaInfos', subBuilder: MetaInfoMap.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mime => $_getSZ(2);
  @$pb.TagNumber(3)
  set mime($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMime() => $_has(2);
  @$pb.TagNumber(3)
  void clearMime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get favorite => $_getBF(3);
  @$pb.TagNumber(4)
  set favorite($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFavorite() => $_has(3);
  @$pb.TagNumber(4)
  void clearFavorite() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isVideo => $_getBF(4);
  @$pb.TagNumber(5)
  set isVideo($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsVideo() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsVideo() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<MetaInfoMap> get metaInfos => $_getList(5);
}

class MetaInfo extends $pb.GeneratedMessage {
  factory MetaInfo({
    $fixnum.Int64? id,
    $core.String? key,
    $core.String? value,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  MetaInfo._() : super();
  factory MetaInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaInfo', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaInfo clone() => MetaInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaInfo copyWith(void Function(MetaInfo) updates) => super.copyWith((message) => updates(message as MetaInfo)) as MetaInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaInfo create() => MetaInfo._();
  MetaInfo createEmptyInstance() => create();
  static $pb.PbList<MetaInfo> createRepeated() => $pb.PbList<MetaInfo>();
  @$core.pragma('dart2js:noInline')
  static MetaInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaInfo>(create);
  static MetaInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class MetaInfoToFile extends $pb.GeneratedMessage {
  factory MetaInfoToFile({
    $fixnum.Int64? fileId,
    $fixnum.Int64? metaInfoId,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (metaInfoId != null) {
      $result.metaInfoId = metaInfoId;
    }
    return $result;
  }
  MetaInfoToFile._() : super();
  factory MetaInfoToFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaInfoToFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaInfoToFile', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fileId', protoName: 'fileId')
    ..aInt64(2, _omitFieldNames ? '' : 'metaInfoId', protoName: 'metaInfoId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaInfoToFile clone() => MetaInfoToFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaInfoToFile copyWith(void Function(MetaInfoToFile) updates) => super.copyWith((message) => updates(message as MetaInfoToFile)) as MetaInfoToFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaInfoToFile create() => MetaInfoToFile._();
  MetaInfoToFile createEmptyInstance() => create();
  static $pb.PbList<MetaInfoToFile> createRepeated() => $pb.PbList<MetaInfoToFile>();
  @$core.pragma('dart2js:noInline')
  static MetaInfoToFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaInfoToFile>(create);
  static MetaInfoToFile? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fileId => $_getI64(0);
  @$pb.TagNumber(1)
  set fileId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get metaInfoId => $_getI64(1);
  @$pb.TagNumber(2)
  set metaInfoId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetaInfoId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetaInfoId() => clearField(2);
}

class MetaInfoMap extends $pb.GeneratedMessage {
  factory MetaInfoMap({
    $core.String? key,
    $core.Iterable<MetaInfoValue>? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value.addAll(value);
    }
    return $result;
  }
  MetaInfoMap._() : super();
  factory MetaInfoMap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaInfoMap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaInfoMap', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..pc<MetaInfoValue>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.PM, subBuilder: MetaInfoValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaInfoMap clone() => MetaInfoMap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaInfoMap copyWith(void Function(MetaInfoMap) updates) => super.copyWith((message) => updates(message as MetaInfoMap)) as MetaInfoMap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaInfoMap create() => MetaInfoMap._();
  MetaInfoMap createEmptyInstance() => create();
  static $pb.PbList<MetaInfoMap> createRepeated() => $pb.PbList<MetaInfoMap>();
  @$core.pragma('dart2js:noInline')
  static MetaInfoMap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaInfoMap>(create);
  static MetaInfoMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<MetaInfoValue> get value => $_getList(1);
}

class MetaInfoValue extends $pb.GeneratedMessage {
  factory MetaInfoValue({
    $fixnum.Int64? id,
    $core.String? value,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  MetaInfoValue._() : super();
  factory MetaInfoValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaInfoValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaInfoValue', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaInfoValue clone() => MetaInfoValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaInfoValue copyWith(void Function(MetaInfoValue) updates) => super.copyWith((message) => updates(message as MetaInfoValue)) as MetaInfoValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaInfoValue create() => MetaInfoValue._();
  MetaInfoValue createEmptyInstance() => create();
  static $pb.PbList<MetaInfoValue> createRepeated() => $pb.PbList<MetaInfoValue>();
  @$core.pragma('dart2js:noInline')
  static MetaInfoValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaInfoValue>(create);
  static MetaInfoValue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class FileRequest extends $pb.GeneratedMessage {
  factory FileRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  FileRequest._() : super();
  factory FileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileRequest', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileRequest clone() => FileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileRequest copyWith(void Function(FileRequest) updates) => super.copyWith((message) => updates(message as FileRequest)) as FileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileRequest create() => FileRequest._();
  FileRequest createEmptyInstance() => create();
  static $pb.PbList<FileRequest> createRepeated() => $pb.PbList<FileRequest>();
  @$core.pragma('dart2js:noInline')
  static FileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileRequest>(create);
  static FileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class MetaInfoRequest extends $pb.GeneratedMessage {
  factory MetaInfoRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  MetaInfoRequest._() : super();
  factory MetaInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaInfoRequest', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaInfoRequest clone() => MetaInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaInfoRequest copyWith(void Function(MetaInfoRequest) updates) => super.copyWith((message) => updates(message as MetaInfoRequest)) as MetaInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaInfoRequest create() => MetaInfoRequest._();
  MetaInfoRequest createEmptyInstance() => create();
  static $pb.PbList<MetaInfoRequest> createRepeated() => $pb.PbList<MetaInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static MetaInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaInfoRequest>(create);
  static MetaInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class MetaType extends $pb.GeneratedMessage {
  factory MetaType({
    $core.String? type,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  MetaType._() : super();
  factory MetaType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaType', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaType clone() => MetaType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaType copyWith(void Function(MetaType) updates) => super.copyWith((message) => updates(message as MetaType)) as MetaType;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaType create() => MetaType._();
  MetaType createEmptyInstance() => create();
  static $pb.PbList<MetaType> createRepeated() => $pb.PbList<MetaType>();
  @$core.pragma('dart2js:noInline')
  static MetaType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaType>(create);
  static MetaType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
