import 'package:booky/Features/home/presentation/views/book_details_view.dart';
import 'package:booky/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const rHomeView = '/homeView';
  static const rBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: rHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: rBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
