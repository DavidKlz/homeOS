import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:homeos/config/constants/homeos_urls.dart';
import 'package:homeos/generated/google/protobuf/empty.pb.dart';
import 'package:homeos/generated/homeOS.pbgrpc.dart';

void main() {
  group("gRPC Test", () {
    test("try to fetch", () {
      var stub = FileRPCClient(
        ClientChannel(
          HomeOSUrls.host,
          port: HomeOSUrls.port,
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()),
        ),
      );

      var res = stub.sync(Empty());
      expect(res, isNot(null));
    });
  });
}
