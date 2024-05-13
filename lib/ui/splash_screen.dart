// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
//
// import 'home_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer when the widget is initialized
//     Future.delayed(Duration(seconds: 3), () {
//       // Navigate to the home screen after 3 seconds
//       Navigator.pushReplacement(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (_, __, ___) => HomeScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//         ),
//       );
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background animation
//           const Positioned.fill(
//             child: RiveAnimation.asset(
//               'assets/animations/cosmos.riv', // Update path if necessary
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Container with glass effect in the center
//           Center(
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(100.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 10.0,
//                     spreadRadius: 5.0,
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/images/logoLightTitle.png', // Update path if necessary
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'dart:async';
//
// import 'package:flutter/material.dart';
// // Import the Rive package if it's not being used elsewhere in your project
// // import 'package:rive/rive.dart';
//
// import 'home_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer when the widget is initialized
//     Future.delayed(Duration(seconds: 3), () {
//       // Navigate to the home screen after 3 seconds
//       Navigator.pushReplacement(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (_, __, ___) => HomeScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background GIF
//           Positioned.fill(
//             child: Image.asset(
//               'assets/bggif/bgGif.gif', // Update path to your GIF file
//               fit: BoxFit.fill,
//             ),
//           ),
//           // Container with glass effect in the center
//           Center(
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(100.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 10.0,
//                     spreadRadius: 5.0,
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/images/logoLightTitle.png', // Update path if necessary
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Import the Rive package if it's not being used elsewhere in your project
// import 'package:rive/rive.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the home screen after 3 seconds
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Conditionally show the appropriate GIF based on platform
          if (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
            Positioned.fill(
              child: Image.asset(
                'assets/bggif/bgGif.gif', // Phone-specific GIF
                fit: BoxFit.fill,
              ),
            )
          else
            Positioned.fill(
              child: Image.asset(
                'assets/bggif/bgGifLarge.gif', // Tablet-specific GIF
                fit: BoxFit.fill,
              ),
            ),
          // Container with glass effect in the center
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/logoLightTitle.png', // Update path if necessary
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
