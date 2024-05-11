import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onboarding_form/firebase_options.dart';
import 'package:onboarding_form/ui/form_screen.dart';
import 'package:onboarding_form/ui/home_screen.dart';
import 'package:onboarding_form/ui/success_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: 'assets/images/logoLightTitle.png',
        splashIconSize: 200,
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
      ),
      routes: {
        '/home': (_) => HomeScreen(),
        '/form': (_) => const FormScreen(),
        '/success': (_) => const SuccessfulScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
