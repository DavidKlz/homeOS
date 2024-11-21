import 'package:grpc/grpc.dart';
import 'package:homeos/generated/google/protobuf/empty.pb.dart';
import 'package:homeos/logic/provider/meta_info_client_provider.dart';
import 'package:homeos/logic/provider/meta_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../generated/homeOS.pb.dart';

part 'meta_type_provider.g.dart';

@riverpod
class MetaTypeService extends _$MetaTypeService {
  @override
  Future<List<MetaType>> build() async {
    return await _readStream(ref.read(metaInfoServiceClientProvider).allTypes(Empty()));
  }

  Future<void> addType(String type) async {
    var response = await ref.read(metaInfoServiceClientProvider).addType(MetaType(type: type));
    if(response.success) {
      ref.read(metaInfoServiceProvider.notifier).all();
      state = AsyncData(await _readStream(ref.read(metaInfoServiceClientProvider).allTypes(Empty())));
    }
  }

  Future<List<MetaType>> _readStream(ResponseStream<MetaType> response) async {
    List<MetaType> files = [];
    await for (var file in response) {
      files.add(file);
    }
    return files;
  }
}