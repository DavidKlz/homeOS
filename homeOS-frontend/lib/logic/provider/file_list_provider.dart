import 'package:grpc/grpc.dart';
import 'package:homeos/generated/google/protobuf/empty.pb.dart';
import 'package:homeos/generated/homeOS.pbgrpc.dart';
import 'package:homeos/logic/provider/file_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_list_provider.g.dart';

@riverpod
class FileListService extends _$FileListService {
  @override
  List<File> build() {
    state = [];
    _readStream(ref.read(fileServiceClientProvider).all(Empty()));
    return state;
  }

  void all() {
    _readStream(ref.read(fileServiceClientProvider).all(Empty()));
  }

  void sync() {
    _readStream(ref.read(fileServiceClientProvider).sync(Empty()));
  }

  void _readStream(ResponseStream<File> response) async {
    await for (var file in response) {
      if(!state.contains(file)) {
        state = [...state, file];
      }
    }
  }
}
