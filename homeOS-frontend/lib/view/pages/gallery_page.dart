import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/constants/homeos_urls.dart';
import '../../config/routes/routes.dart';
import '../../logic/provider/file_list_provider.dart';

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage({super.key});

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double minSize = constraints.maxWidth / 4;
      int countOfImages = (constraints.maxWidth / 200).round();
      double size = min(minSize, constraints.maxWidth / countOfImages);

      return SingleChildScrollView(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: ref
              .watch(fileListServiceProvider)
              .map(
                (file) => InkWell(
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    Routes.detail,
                    arguments: ref.read(fileListServiceProvider).indexOf(file),
                  ),
                  child: SizedBox(
                    width: size - 5,
                    height: size - 5,
                    child: Hero(
                      tag: 'media-${file.id}',
                      child: Image.network(
                        HomeOSUrls.thumbById(file.id),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}