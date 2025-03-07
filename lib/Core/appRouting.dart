import 'package:go_router/go_router.dart';
import 'package:gofood/Features/splash2/presentation/views/splash2.dart';
import 'package:gofood/Features/splashView/presentation/views/SplashView.dart';

class AppRoutes {
  static const kSplash = '/';
  static const kLogin = '/login';
  static const kForget = '/forget';
  static const kSignup = "/signup";
  static const ksplash2 = "/splash2";
  static const kVerifiy = "/verify";
  static const kHome = "/home";
  static const kDetails = "/details";
  static const kFavorite = "/favorite";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
      GoRoute(path: ksplash2, builder: (context, state) => const Splash2()),
      // GoRoute(path: kForget, builder: (context, state) => const ForgotView()),
      // GoRoute(path: kSignup, builder: (context, state) => const SignUpView()),
      // GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
      // GoRoute(path: kVerifiy, builder: (context, state) => const VerifiyView()),
      // GoRoute(path: kHome, builder: (context, state) => const HomeView()),
      // GoRoute(
      //   path: kDetails,
      //   builder: (context, state) => const PopularDetailsView(),
      // ),
      // GoRoute(
      //   path: kFavorite,
      //   builder: (context, state) => const FavouriteView(),
      // ),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
