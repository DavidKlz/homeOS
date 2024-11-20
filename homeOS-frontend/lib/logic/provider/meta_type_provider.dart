import 'package:grpc/grpc.dart';
import 'package:homeos/generated/google/protobuf/empty.pb.dart';
import 'package:homeos/logic/provider/meta_info_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../generated/homeOS.pb.dart';

part 'meta_type_provider.g.dart';

@riverpod
class MetaTypeService extends _$MetaTypeService {
  @override
  Future<List<MetaType>> build() {
    return _readStream(ref.read(metaInfoServiceClientProvider).allTypes(Empty()));
  }

  Future<void> addType(String type) async {
    ref.read(metaInfoServiceClientProvider).addType(MetaType(type: type));
  }

  Future<List<MetaType>> _readStream(ResponseStream<MetaType> response) async {
    List<MetaType> files = [];
    await for (var file in response) {
      files.add(file);
    }
    return files;
  }
}