import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:homeos/generated/google/protobuf/empty.pb.dart';
import 'package:homeos/logic/provider/meta_info_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../generated/homeOS.pb.dart';

part 'meta_info_provider.g.dart';

@riverpod
class MetaInfoService extends _$MetaInfoService {
  @override
  Future<List<MetaInfoMap>> build() async {
    return await _readStream(
        ref.read(metaInfoServiceClientProvider).all(Empty()));
  }

  Future<void> all() async {
    state = AsyncData(await _readStream(
        ref.read(metaInfoServiceClientProvider).all(Empty())));
  }

  Future<void> add(MetaInfo metaInfo) async {
    ref
        .read(metaInfoServiceClientProvider)
        .safe(metaInfo)
        .whenComplete(() => all());
  }

  Future<void> remove(Int64 id) async {
    ref
        .read(metaInfoServiceClientProvider)
        .remove(MetaInfoRequest(id: id))
        .whenComplete(() => all());
  }

  Future<List<MetaInfoMap>> _readStream(
      ResponseStream<MetaInfoMap> response) async {
    List<MetaInfoMap> metaInfos = [];
    await for (var metaInfo in response) {
      metaInfos.add(metaInfo);
    }
    return metaInfos;
  }
}
