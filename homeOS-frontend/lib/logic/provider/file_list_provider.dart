import 'package:fixnum/fixnum.dart';
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
    _readStream(ref.read(fileServiceClientProvider).all(Empty()), false);
    return state;
  }

  void all() {
    _readStream(ref.read(fileServiceClientProvider).all(Empty()), false);
  }

  void sync() {
    _readStream(ref.read(fileServiceClientProvider).sync(Empty()), true);
  }

  void remove(final Int64 id) async {
    var result = await ref.read(fileServiceClientProvider).delete(FileRequest(id: id));
    if(result.success) {
      state.removeWhere((element) => element.id == id);
    }
  }

  void setFavorite(final Int64 id, final bool favorite) async {
    var result = await ref
        .read(fileServiceClientProvider)
        .setFavorite(FileRequest(id: id, favorite: favorite));
    state = state.map((e) => e.id == id ? result : e).toList();
  }

  void _readStream(ResponseStream<File> response, bool reverse) async {
    await for (var file in response) {
      if (!state.contains(file)) {
        if (reverse) {
          state = [file, ...state];
        } else {
          state = [...state, file];
        }
      }
    }
  }
}
