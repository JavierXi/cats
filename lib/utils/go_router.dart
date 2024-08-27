import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/cats/presentation/views/cat_detail_view.dart';
import 'package:cats/cats/presentation/views/cats_view.dart';
import 'package:cats/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:cats/utils/routes.dart';

class AppGoRouter {
  static GoRouter all = GoRouter(
    routes: [
      GoRoute(
        name: "Splash view",
        path: AppRoutes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: "Cats view",
        path: AppRoutes.catsView,
        builder: (context, state) => const CatsView(),
      ),
      GoRoute(
        name: "Cat detail view",
        path: AppRoutes.catDetailView,
        builder: (context, state) {
          CatModel arguments = state.extra as CatModel;
          return CatDetailView(cat: arguments);
        },
      ),
    ],
  );
}
