import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/generated/homeOS.pb.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../config/constants/homeos_urls.dart';

class DetailVideoWidget extends ConsumerStatefulWidget {
  final File file;

  const DetailVideoWidget({required this.file, super.key});

  @override
  ConsumerState<DetailVideoWidget> createState() => _DetailVideoWidgetState();
}

class _DetailVideoWidgetState extends ConsumerState<DetailVideoWidget>
    with TickerProviderStateMixin {
  late final videoPlayer = Player();
  late final videoController = VideoController(videoPlayer);

  @override
  void initState() {
    super.initState();
    videoPlayer.open(Media(HomeOSUrls.fileById(widget.file.id)));
    videoPlayer.pause();
  }

  @override
  void dispose() {
    videoPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(controller: videoController);
  }
}
