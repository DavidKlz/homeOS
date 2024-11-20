//
//  Generated code. Do not modify.
//  source: homeOS.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use defaultResponseDescriptor instead')
const DefaultResponse$json = {
  '1': 'DefaultResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `DefaultResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List defaultResponseDescriptor = $convert.base64Decode(
    'Cg9EZWZhdWx0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIdCgdtZXNzYWdlGA'
    'IgASgJSABSB21lc3NhZ2WIAQFCCgoIX21lc3NhZ2U=');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'mime', '3': 3, '4': 1, '5': 9, '10': 'mime'},
    {'1': 'favorite', '3': 4, '4': 1, '5': 8, '10': 'favorite'},
    {'1': 'isVideo', '3': 5, '4': 1, '5': 8, '10': 'isVideo'},
    {'1': 'metaInfos', '3': 6, '4': 3, '5': 11, '6': '.MetaInfoMap', '10': 'metaInfos'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBG1pbWUYAyABKA'
    'lSBG1pbWUSGgoIZmF2b3JpdGUYBCABKAhSCGZhdm9yaXRlEhgKB2lzVmlkZW8YBSABKAhSB2lz'
    'VmlkZW8SKgoJbWV0YUluZm9zGAYgAygLMgwuTWV0YUluZm9NYXBSCW1ldGFJbmZvcw==');

@$core.Deprecated('Use metaInfoDescriptor instead')
const MetaInfo$json = {
  '1': 'MetaInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'id', '17': true},
    {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
  '8': [
    {'1': '_id'},
  ],
};

/// Descriptor for `MetaInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaInfoDescriptor = $convert.base64Decode(
    'CghNZXRhSW5mbxITCgJpZBgBIAEoA0gAUgJpZIgBARIQCgNrZXkYAiABKAlSA2tleRIUCgV2YW'
    'x1ZRgDIAEoCVIFdmFsdWVCBQoDX2lk');

@$core.Deprecated('Use metaInfoToFileDescriptor instead')
const MetaInfoToFile$json = {
  '1': 'MetaInfoToFile',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 3, '10': 'fileId'},
    {'1': 'metaInfoId', '3': 2, '4': 1, '5': 3, '10': 'metaInfoId'},
  ],
};

/// Descriptor for `MetaInfoToFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaInfoToFileDescriptor = $convert.base64Decode(
    'Cg5NZXRhSW5mb1RvRmlsZRIWCgZmaWxlSWQYASABKANSBmZpbGVJZBIeCgptZXRhSW5mb0lkGA'
    'IgASgDUgptZXRhSW5mb0lk');

@$core.Deprecated('Use metaInfoMapDescriptor instead')
const MetaInfoMap$json = {
  '1': 'MetaInfoMap',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 3, '5': 11, '6': '.MetaInfoValue', '10': 'value'},
  ],
};

/// Descriptor for `MetaInfoMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaInfoMapDescriptor = $convert.base64Decode(
    'CgtNZXRhSW5mb01hcBIQCgNrZXkYASABKAlSA2tleRIkCgV2YWx1ZRgCIAMoCzIOLk1ldGFJbm'
    'ZvVmFsdWVSBXZhbHVl');

@$core.Deprecated('Use metaInfoValueDescriptor instead')
const MetaInfoValue$json = {
  '1': 'MetaInfoValue',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `MetaInfoValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaInfoValueDescriptor = $convert.base64Decode(
    'Cg1NZXRhSW5mb1ZhbHVlEg4KAmlkGAEgASgDUgJpZBIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU=');

@$core.Deprecated('Use fileRequestDescriptor instead')
const FileRequest$json = {
  '1': 'FileRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `FileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileRequestDescriptor = $convert.base64Decode(
    'CgtGaWxlUmVxdWVzdBIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use metaInfoRequestDescriptor instead')
const MetaInfoRequest$json = {
  '1': 'MetaInfoRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `MetaInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaInfoRequestDescriptor = $convert.base64Decode(
    'Cg9NZXRhSW5mb1JlcXVlc3QSDgoCaWQYASABKANSAmlk');

@$core.Deprecated('Use metaTypeDescriptor instead')
const MetaType$json = {
  '1': 'MetaType',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `MetaType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaTypeDescriptor = $convert.base64Decode(
    'CghNZXRhVHlwZRISCgR0eXBlGAEgASgJUgR0eXBl');

