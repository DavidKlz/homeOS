import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/generated/homeOS.pb.dart';

import '../../config/constants/homeos_urls.dart';
import 'detail_video_widget.dart';

class DetailViewWidget extends ConsumerWidget {
  final File file;

  const DetailViewWidget({required this.file, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: (file.isVideo)
          ? DetailVideoWidget(file: file)
          : InteractiveViewer(
              clipBehavior: Clip.none,
              child: Image.network(
                HomeOSUrls.fileById(file.id),
                fit: BoxFit.contain,
              ),
            ),
    );
  }
}
