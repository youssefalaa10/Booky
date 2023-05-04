import 'package:booky/Features/home/data/models/book_model/book_model.dart';
import 'package:booky/Features/home/data/repos/home_repo_impl.dart';
import 'package:booky/Features/home/presentation/views/book_details_view.dart';
import 'package:booky/Features/home/presentation/views/home_view.dart';
import 'package:booky/core/utils/services_locator/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/presentation/view_models/recommended_books_cubit/recommended_books_cubit.dart';
import '../../Features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const rHomeView = '/homeView';
  static const rBookDetailsView = '/bookDetailsView';
  static const rSearchView = '/searchView';
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
        builder: (context, state) => BlocProvider(
          create: (context) => RecommendedBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: rSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
