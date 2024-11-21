import 'package:flutter/material.dart';

class FileOverlay extends StatelessWidget {
  final VoidCallback onPop;
  final VoidCallback onMetaInfo;
  final VoidCallback onFavorite;
  final bool isFavorite;

  const FileOverlay({
    required this.onPop,
    required this.onMetaInfo,
    required this.onFavorite,
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10,
          top: 10,
          child: IconButton(
            onPressed: onPop,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Row(
            children: [
              IconButton(
                onPressed: onFavorite,
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              ),
              IconButton(
                onPressed: onMetaInfo,
                icon: const Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
