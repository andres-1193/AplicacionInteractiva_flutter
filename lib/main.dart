import 'package:flutter/material.dart';
import 'package:my_application_1/src/routers/my_application1_app_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myApplicationAppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
