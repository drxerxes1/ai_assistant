import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'helper/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Pref.initialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueAccent[50],
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
          ),
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.blueGrey),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )),
      title: appName,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
