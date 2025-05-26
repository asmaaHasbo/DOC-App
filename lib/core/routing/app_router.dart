import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/auth/screens/login_screen.dart';
import 'package:doc_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.onboarding:
      return MaterialPageRoute(builder: (_) =>OnboardingScreen());
     
      case '/login':
      return MaterialPageRoute(builder: (_) =>  LoginScreen());
      
      default:
      // Unknown route
      return MaterialPageRoute(
        builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
    }
  }
}