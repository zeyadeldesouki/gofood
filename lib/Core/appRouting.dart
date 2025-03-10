import 'package:go_router/go_router.dart';
import 'package:gofood/Features/VerifiyView/presentation/views/VerifiyView.dart';
import 'package:gofood/Features/forgotpassword/presentation/views/forgotVerifiyView.dart';
import 'package:gofood/Features/forgotpassword/presentation/views/forgotpassword.dart';
import 'package:gofood/Features/forgotpassword/presentation/views/resetPasswordView.dart';
import 'package:gofood/Features/home/presentation/views/homeview.dart';
import 'package:gofood/Features/signIn/presentation/views/signInView.dart';
import 'package:gofood/Features/signUp/presentation/views/signUpView.dart';
import 'package:gofood/Features/splashView/presentation/views/splashView.dart';
import 'package:gofood/Features/appView/presentation/views/appView.dart';

class AppRoutes {
  static const kAppLogo = '/';
  static const kSignIn = '/login';
  static const kForget = '/forget';
  static const kSignup = "/signup";
  static const ksplash = "/splash";
  static const kVerifiy = "/verify";
  static const kHome = "/home";
  static const kresetpassword = "/resetpassword";
  static const kForgotVerifiy = "/forgotverifiy";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kAppLogo, builder: (context, state) => const appView()),
      GoRoute(path: ksplash, builder: (context, state) => const splashView()),
      GoRoute(path: kSignup, builder: (context, state) => const Signupview()),
      GoRoute(path: kSignIn, builder: (context, state) => const Signinview()),
      GoRoute(path: kVerifiy, builder: (context, state) => const VerifiyView()),
      GoRoute(path: kHome, builder: (context, state) => const Homeview()),
      GoRoute(
        path: kresetpassword,
        builder: (context, state) => const Resetpasswordview(),
      ),

      GoRoute(
        path: kForget,
        builder: (context, state) => const Forgotpassword(),
      ),
      GoRoute(
        path: kForgotVerifiy,
        builder: (context, state) => const forgotVerifiyView(),
      ),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
