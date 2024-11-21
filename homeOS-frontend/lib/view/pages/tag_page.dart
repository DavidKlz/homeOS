import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/generated/homeOS.pb.dart';

import '../../logic/provider/meta_info_provider.dart';
import '../../logic/provider/meta_type_provider.dart';
import '../widgets/tag_input.dart';

class TagPage extends ConsumerStatefulWidget {
  const TagPage({super.key});

  @override
  ConsumerState<TagPage> createState() => _TagPageState();
}

class _TagPageState extends ConsumerState<TagPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: ref.watch(metaTypeServiceProvider).when(
              data: (data) {
                return data
                    .map(
                      (e) => TagInput(
                        type: e.type,
                        onAddTag: _onAddTag,
                        onRemoveTag: _onRemoveTag,
                      ),
                    )
                    .toList();
              },
              error: (error, stackTrace) => [const Text("Error loading Tags")],
              loading: () => [
                const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
      ),
    );
  }

  void _onAddTag(MetaInfo value) {
    ref.read(metaInfoServiceProvider.notifier).add(value);
  }

  void _onRemoveTag(Int64 id) {
    ref.read(metaInfoServiceProvider.notifier).remove(id);
  }
}
