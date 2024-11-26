import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/homeOS.pb.dart';
import '../../logic/provider/file_list_provider.dart';
import '../../logic/provider/meta_info_provider.dart';
import 'meta_info_input.dart';

class FileOverlay extends ConsumerStatefulWidget {
  final File file;
  final VoidCallback onPop;
  final VoidCallback onFavorite;
  final bool isFavorite;

  const FileOverlay({
    required this.file,
    required this.onPop,
    required this.onFavorite,
    required this.isFavorite,
    super.key,
  });

  @override
  ConsumerState createState() => _FileOverlayState();
}

class _FileOverlayState extends ConsumerState<FileOverlay> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(metaInfoServiceProvider).when(
      data: (data) => Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: IconButton(
              onPressed: widget.onPop,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onFavorite,
                  icon: Icon(widget.isFavorite ? Icons.favorite : Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () => onMetaInfo(widget.file, data),
                  icon: const Icon(Icons.info_outline),
                ),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => Text(stackTrace.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }

  void onMetaInfo(File currentFile, List<MetaInfoMap> allMetaInfos) {
    showStickyFlexibleBottomSheet(
      minHeight: 0.4,
      initHeight: 0.4,
      maxHeight: 1,
      headerHeight: 55,
      anchors: [0.4, 0.8, 1],
      context: context,
      useRootNavigator: true,
      headerBuilder: (context, bottomSheetOffset) => Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.surface,
        child: const Center(
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
      bodyBuilder: (context, bottomSheetOffset) => SliverChildListDelegate(
        _generateMetaInfoInputs(context, currentFile, allMetaInfos),
      ),
    );
  }

  List<Widget> _generateMetaInfoInputs(
      BuildContext context, File currentFile, List<MetaInfoMap> allMetaInfos) {
    List<Widget> widgets = List.empty(growable: true);
    for (var t in allMetaInfos) {
      var fileInfo = currentFile.metaInfos
          .where(
            (element) => element.key == t.key,
      )
          .isNotEmpty
          ? currentFile.metaInfos.firstWhere((e) => e.key == t.key)
          : MetaInfoMap(key: t.key, value: []);
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MetaInfoInput(
            fileInfos: fileInfo,
            allInfos: t,
            onAdd: (metaInfoId) => onAdd(currentFile.id, metaInfoId),
            onRemove: (metaInfoId) => onRemove(currentFile.id, metaInfoId),
          ),
        ),
      );
    }
    return widgets;
  }

  Future<bool> onAdd(Int64 fileId, metaInfoId) async {
    await ref
        .read(fileListServiceProvider.notifier)
        .addMetaInfo(fileId, metaInfoId);
    setState(() {});
    return true;
  }

  Future<bool> onRemove(Int64 fileId, metaInfoId) async {
    await ref
        .read(fileListServiceProvider.notifier)
        .removeMetaInfo(fileId, metaInfoId);
    setState(() {});
    return true;
  }
}
