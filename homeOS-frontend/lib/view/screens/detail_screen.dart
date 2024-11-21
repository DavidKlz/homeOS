import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/view/widgets/file_overlay.dart';

import '../../logic/provider/file_list_provider.dart';
import '../widgets/detail_view_widget.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final int index;

  const DetailScreen({required this.index, super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: widget.index,
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height,
            onPageChanged: (index, reason) =>
                setState(() => currentIndex = index),
          ),
          items: ref.watch(fileListServiceProvider).map((e) {
            return Stack(
              children: [
                Hero(
                    tag: 'media-${e.id}', child: DetailViewWidget(file: e)),
                FileOverlay(
                  onPop: onPop,
                  onMetaInfo: onMetaInfo,
                  onFavorite: () => ref.read(fileListServiceProvider.notifier).setFavorite(e.id, !e.favorite),
                  isFavorite: e.favorite,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  void onPop() {
    Navigator.of(context).pop(currentIndex);
  }

  void onMetaInfo() {
    showStickyFlexibleBottomSheet(
      minHeight: 0.4,
      initHeight: 0.4,
      maxHeight: 1,
      headerHeight: 55,
      anchors: [0.4, 0.8, 1],
      context: context,
      useRootNavigator: true,
      headerBuilder: (context, bottomSheetOffset) => const SizedBox(
        height: 55,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.drag_handle),
              Text(
                "Meta Infos",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      bodyBuilder: (context, bottomSheetOffset) =>
          SliverChildListDelegate(_generateMetaInfoInputs(context)),
    );
  }

  List<Widget> _generateMetaInfoInputs(BuildContext context) {
    List<Widget> widgets = List.empty(growable: true);

    return widgets;
  }
}
