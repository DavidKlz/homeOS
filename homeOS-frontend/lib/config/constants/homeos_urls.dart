import 'package:fixnum/fixnum.dart';

class HomeOSUrls {
  HomeOSUrls._();

  static const String host = "localhost";
  static const int port = 9090;
  static const String file = "http://$host:8080/api/file";
  static String fileById(Int64 id) => "$file/$id";
  static String thumbById(Int64 id) => "$file/thumb/$id";
}
