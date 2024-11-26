import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/logic/provider/meta_info_provider.dart';

import '../../generated/homeOS.pb.dart';

class TagInput extends ConsumerStatefulWidget {
  final String type;
  final Function(MetaInfo value) onAddTag;
  final Function(Int64 id) onRemoveTag;

  const TagInput({
    required this.type,
    required this.onAddTag,
    required this.onRemoveTag,
    super.key,
  });

  @override
  ConsumerState<TagInput> createState() => _TagInputState();
}

class _TagInputState extends ConsumerState<TagInput> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (value) => setState(() {}),
          onSubmitted: _onSubmitted,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter ${widget.type}',
          ),
        ),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 5,
            children: _buildChips(),
          ),
        )
      ],
    );
  }

  void _onSubmitted(String value) {
    widget.onAddTag.call(MetaInfo(key: widget.type, value: value));
    controller.text = "";
    focusNode.requestFocus();
  }

  void _onDeleted(Int64 id) {
    widget.onRemoveTag.call(id);
  }

  List<Widget> _buildChips() {
    return ref.watch(metaInfoServiceProvider).when(
          data: (data) {
            var metaInfo =
                data.where((element) => element.key == widget.type).first;
            return metaInfo.value
                .where((element) => (controller.text.isNotEmpty)
                    ? element.value.startsWith(controller.text)
                    : true)
                .map(
                  (e) => Chip(
                    label: Text(e.value),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () => _onDeleted(e.id),
                  ),
                )
                .toList();
          },
          error: (error, stackTrace) =>
              [Text("Failed to load values of ${widget.type}")],
          loading: () => [const CircularProgressIndicator()],
        );
  }
}
