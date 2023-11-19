import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitty/app/login/login_screen.dart';
import 'package:splitty/app/main_screen/main_screen.dart';
import 'package:splitty/config/config.dart';
import 'package:splitty/config/theme.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+

void main() async {
  var widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const LoginScreen(),
        routes: {
          "/login": (context) => const LoginScreen(),
          "/main": (context) => const MainScreen(),
        },
      ),
    );
  }
}
