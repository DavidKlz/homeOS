import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/logic/provider/meta_type_provider.dart';

class AlbumPage extends ConsumerStatefulWidget {
  const AlbumPage({super.key});

  @override
  ConsumerState<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends ConsumerState<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(metaTypeServiceProvider).when(
          data: (data) => Column(
            children: [
              DropdownMenu(
                dropdownMenuEntries: data
                    .map((e) => DropdownMenuEntry(value: e, label: e.type))
                    .toList(),
              ),

            ],
          ),
          error: (error, stackTrace) => const Center(
            child: Text("Couldn't load Types"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
