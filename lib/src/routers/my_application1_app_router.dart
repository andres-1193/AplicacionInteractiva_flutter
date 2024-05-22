import 'package:go_router/go_router.dart';
import 'package:my_application_1/src/feature/screens/age_screen.dart';
import 'package:my_application_1/src/feature/screens/home_screen.dart';
import 'package:my_application_1/src/feature/screens/imc_screen.dart';
import 'package:my_application_1/src/feature/screens/workday_scree.dart';
import 'package:my_application_1/src/feature/screens/zodiac_screen.dart';

class myApplicationAppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/imc', builder: (context, state) => ImcScreen()),
    GoRoute(path: '/age', builder: (context, state) => AgeScreen()),
    GoRoute(path: '/zodiac', builder: (context, state) => ZodiacScreen()),
    GoRoute(path: '/workDay', builder: (context, state) => WorkdayScreen()),
  ]);
}
