import 'package:fluro/fluro.dart';
import './router_handles.dart';

class Routes {
  static String root = '/';
  static String dogListPage = '/dogListPage';
  static String dogSubListPage = '/dogSubListPage';

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: rootHandle);
    router.define(dogListPage, handler: dogListPageHandle);
    router.define(dogSubListPage, handler: dogSubListPageHandle);
  }
}
