import 'package:grpc/grpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/constants/homeos_urls.dart';
import '../../generated/homeOS.pbgrpc.dart';

part 'file_client_provider.g.dart';

@riverpod
class FileServiceClient extends _$FileServiceClient {
  @override
  FileRPCClient build() {
    return FileRPCClient(
      ClientChannel(
        HomeOSUrls.host,
        port: HomeOSUrls.port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectionTimeout: Duration(seconds: 10),
        ),
      ),
    );
  }
}
