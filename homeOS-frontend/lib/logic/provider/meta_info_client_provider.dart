import 'package:grpc/grpc.dart';
import 'package:homeos/generated/homeOS.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/constants/homeos_urls.dart';

part 'meta_info_client_provider.g.dart';

@riverpod
class MetaInfoServiceClient extends _$MetaInfoServiceClient {
  @override
  MetaInfoRPCClient build() {
    return MetaInfoRPCClient(
      ClientChannel(
        HomeOSUrls.host,
        port: HomeOSUrls.port,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      ),
    );
  }
}