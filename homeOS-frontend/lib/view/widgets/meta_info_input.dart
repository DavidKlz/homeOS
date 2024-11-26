import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/homeOS.pb.dart';

class MetaInfoInput extends ConsumerStatefulWidget {
  final MetaInfoMap fileInfos;
  final MetaInfoMap allInfos;
  final Future<bool> Function(Int64 metaInfoId) onAdd;
  final Future<bool> Function(Int64 metaInfoId) onRemove;

  const MetaInfoInput({
    required this.fileInfos,
    required this.allInfos,
    required this.onAdd,
    required this.onRemove,
    super.key,
  });

  @override
  ConsumerState createState() => _MetaInfoInputState();
}

class _MetaInfoInputState extends ConsumerState<MetaInfoInput> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Autocomplete<MetaInfoValue>(
          fieldViewBuilder:
              ((context, textEditingController, focusNode, onFieldSubmitted) =>
                  TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (value) => onFieldSubmitted,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: const OutlineInputBorder(gapPadding: 1),
                      hintText: "Search ${widget.fileInfos.key}...",
                    ),
                  )),
          displayStringForOption: (option) => option.value,
          optionsBuilder: (textEditingValue) => (textEditingValue.text.isEmpty)
              ? const Iterable<MetaInfoValue>.empty()
              : widget.allInfos.value.where((element) =>
                  element.value.startsWith(textEditingValue.text) &&
                  !widget.fileInfos.value.contains(element)),
          onSelected: _onSubmitted,
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

  void _onSubmitted(MetaInfoValue value) async {
    var added = await widget.onAdd.call(value.id);
    if (added) {
      setState(() {
        widget.fileInfos.value.add(value);
        controller.text = "";
        focusNode.requestFocus();
      });
    }
  }

  void _onDeleted(Int64 id) async {
    var removed = await widget.onRemove.call(id);
    if (removed) {
      setState(() => widget.fileInfos.value.removeWhere((element) => element.id == id));
    }
  }

  List<Widget> _buildChips() {
    return widget.fileInfos.value
        .map(
          (e) => Chip(
            label: Text(e.value),
            deleteIcon: const Icon(Icons.close),
            onDeleted: () => _onDeleted(e.id),
          ),
        )
        .toList();
  }
}
