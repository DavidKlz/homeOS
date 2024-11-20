import 'package:flutter/material.dart';

import '../config/routes/home_os_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: HomeOSRouter.onGenerateRoute,
    );
  }
}
