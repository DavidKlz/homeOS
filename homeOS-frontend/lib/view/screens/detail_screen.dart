import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  CarouselSliderController controller = CarouselSliderController();

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                initialPage: widget.index,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height,
                onPageChanged: (index, reason) =>
                    setState(() => currentIndex = index),
              ),
              items: ref
                  .watch(fileListServiceProvider)
                  .map(
                    (e) => Hero(
                      tag: 'media-${e.id}',
                      child: DetailViewWidget(file: e),
                    ),
                  )
                  .toList(),
            ),
            getFileOverlay(),
          ],
        ),
      ),
    );
  }

  FileOverlay getFileOverlay() {
    var file = ref.watch(fileListServiceProvider).elementAt(currentIndex);
    return FileOverlay(
      file: file,
      onPop: onPop,
      onFavorite: () => ref
          .read(fileListServiceProvider.notifier)
          .setFavorite(file.id, !file.favorite),
      isFavorite: file.favorite,
    );
  }

  void onPop() {
    Navigator.of(context).pop(currentIndex);
  }

  bool _onKey(KeyEvent event) {
    if(event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      controller.previousPage();
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      controller.nextPage();
    } else if(event.logicalKey == LogicalKeyboardKey.browserBack || event.logicalKey == LogicalKeyboardKey.goBack) {
      onPop();
    }
    return false;
  }
}
