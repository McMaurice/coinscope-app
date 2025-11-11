import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/presentation/screens/detail_screen.dart';
import 'package:coinscope_app/src/presentation/screens/home_screen.dart';
import 'package:coinscope_app/src/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/detailScreen',
      builder: (context, state) {
        final coin = state.extra as CoinModel; 
        return DetailScreen(coin: coin);
      },
    ),
  ],
);
