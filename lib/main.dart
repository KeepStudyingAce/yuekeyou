import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nav_stack/nav_stack.dart';
import 'package:yuekeyouinterview/common_widget/loading.dart';
import 'package:yuekeyouinterview/pages/entrance_page.dart';
import 'package:yuekeyouinterview/routers/application.dart';
import 'package:yuekeyouinterview/routers/routers.dart';

void main() {
  runApp(const MyApp());
  Loading.configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => AppcomponentState();
}

class AppcomponentState extends State<MyApp> {
  AppcomponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EntrancePage(),
      builder: EasyLoading.init(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
