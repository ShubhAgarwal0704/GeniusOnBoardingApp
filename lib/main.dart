// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lottie/lottie.dart';
// import 'package:onboarding_form/firebase_options.dart';
// import 'package:onboarding_form/ui/form_screen.dart';
// import 'package:onboarding_form/ui/home_screen.dart';
// import 'package:onboarding_form/ui/success_screen.dart';
//
// const List<String> _lottieFilePaths = [
//   'assets/animations/waves.json',
//   'assets/animations/stars.json',
//   // ... more animations
// ];
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: false);
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _currentAnimationIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimatedSplashScreen(
//
//         splash: Stack(
//           children: [
//             // Background color (optional)
//             Container(
//               color: Colors.black, // Or any desired background color
//             ),
//             Center(
//               // Combine logo and Lottie animation
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/logoLightTitle.png',
//                     width: 200, // Adjust logo size as needed
//                     height: 200, // Adjust logo size as needed
//                   ),
//                   FutureBuilder(
//                     future: _playAnimation(_currentAnimationIndex),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator(); // Show loading indicator
//                       } else {
//                         return Lottie.asset(
//                           _lottieFilePaths[_currentAnimationIndex],
//                           width: 150, // Adjust animation size as needed
//                           height: 150, // Adjust animation size as needed
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         splashIconSize: 200, // Adjust icon size if needed
//         nextScreen: HomeScreen(),
//         splashTransition: SplashTransition.fadeTransition,
//       ),
//       routes: {
//         '/home': (_) => HomeScreen(),
//         '/form': (_) => const FormScreen(),
//         '/success': (_) => const SuccessfulScreen(),
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
//
//   Future<void> _playAnimation(int index) async {
//     // Replace with actual animation duration logic
//     await Future.delayed(Duration(seconds: 2)); // Adjust delay for each animation
//     setState(() {
//       _currentAnimationIndex = (index + 1) % _lottieFilePaths.length; // Cycle through animations
//     });
//   }
// }

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onboarding_form/firebase_options.dart';
import 'package:onboarding_form/ui/form_screen.dart';
import 'package:onboarding_form/ui/home_screen.dart';
import 'package:onboarding_form/ui/splash_screen.dart';
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
      home: SplashScreen(),
      routes: {
        '/home': (_) => const HomeScreen(),
        '/form': (_) => const FormScreen(),
        '/success': (_) => const SuccessfulScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
