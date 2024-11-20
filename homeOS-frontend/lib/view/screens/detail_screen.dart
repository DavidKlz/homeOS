import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/provider/file_list_provider.dart';
import '../widgets/detail_view_widget.dart';

class DetailScreen extends ConsumerWidget {
  final int index;

  const DetailScreen({required this.index, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: index,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height,
              ),
              items: ref.watch(fileListServiceProvider).map((e) {
                return Hero(
                    tag: 'media-${e.id}', child: DetailViewWidget(file: e));
              }).toList(),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
