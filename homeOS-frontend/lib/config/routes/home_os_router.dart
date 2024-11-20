import 'package:flutter/material.dart';

import '../../view/pages/album_page.dart';
import '../../view/pages/gallery_page.dart';
import '../../view/pages/tag_page.dart';
import '../../view/screens/detail_screen.dart';
import '../../view/screens/home_screen.dart';
import 'routes.dart';

class HomeOSRouter {
  HomeOSRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.detail:
        var index = settings.arguments as int;
        return _createRoute(DetailScreen(
          index: index,
        ));
      case Routes.home:
      default:
        return _createRoute(const HomeScreen());
    }
  }

  static Route<dynamic> onGenerateHomePage(RouteSettings settings) {
    switch (settings.name) {
      case Routes.tags:
        return _createFadeAnimationRoute(const TagPage());
      case Routes.album:
        return _createFadeAnimationRoute(const AlbumPage());
      case Routes.home:
      default:
        return _createFadeAnimationRoute(const GalleryPage());
    }
  }

  static MaterialPageRoute _createRoute(Widget screen) {
    return MaterialPageRoute(
      builder: (context) => screen,
    );
  }

  static PageRouteBuilder _createFadeAnimationRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (c, a, a2) => screen,
      transitionsBuilder: (context, anim, anim2, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  static PageRouteBuilder _createSlideAnimationRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (c, a, a2) => screen,
      transitionsBuilder: (c, anim, anim2, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: anim.drive(tween),
          child: child,
        );
      },
    );
  }
}
