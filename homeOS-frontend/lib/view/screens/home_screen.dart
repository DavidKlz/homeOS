import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeos/logic/provider/meta_info_provider.dart';

import '../../config/routes/home_os_router.dart';
import '../../config/routes/routes.dart';
import '../../logic/provider/file_list_provider.dart';
import '../../logic/provider/meta_type_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final navigationKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "homeOS",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        actions: [
          if (currentIndex == 0)
            IconButton(
                onPressed: () => ref.read(fileListServiceProvider.notifier).sync(),
                icon: const Icon(Icons.sync))
        ],
      ),
      floatingActionButton:
          (currentIndex == 2) ? FloatingActionButton(onPressed: onPress, child: const Icon(Icons.add),) : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Gallery"),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album), label: "Album"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add), label: "Tags"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              navigationKey.currentState
                  ?.pushNamedAndRemoveUntil(Routes.gallery, (_) => false);
              setState(() => currentIndex = 0);
              break;
            case 1:
              setState(() => currentIndex = 1);
              break;
            case 2:
              navigationKey.currentState
                  ?.pushNamedAndRemoveUntil(Routes.tags, (_) => false);
              setState(() => currentIndex = 2);
              break;
          }
        },
      ),
      body: Navigator(
        key: navigationKey,
        onGenerateRoute: HomeOSRouter.onGenerateHomePage,
      ),
    );
  }

  void onPress() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Add Type", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Enter new Type',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => ref
                          .read(metaTypeServiceProvider.notifier)
                          .addType(controller.text),
                      child: const Text("Anlegen"),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Abbrechen"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
