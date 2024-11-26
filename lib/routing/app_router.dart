import 'package:auto_route/auto_route.dart';
import 'package:login_page_flutter_demo/routing/app_router.gr.dart';
import 'package:login_page_flutter_demo/routing/routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUpRoute.page,
          path: Routes.signUp,
          initial: true,
        ),
      ];
}
