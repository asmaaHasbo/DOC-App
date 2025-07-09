import 'package:doc_app/core/di/dependency_injection.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/auth/login/ui/login_screen.dart';
import 'package:doc_app/features/home/ui/home_screen.dart';
import 'package:doc_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  //--------------- دي عباره عن داله بتعرف مسار التنقل بين الشاشات في التطبيق ---------------
  Route generateRoute(RouteSettings settings) {
    //--- ال settings.name هو اسم الشاشة اللي المستخدم عايز يروح ليها
    //--- هنا بنستخدم switch case عشان نحدد كل مسار من المسارات اللي موجوده في التطبيق
    //--- كل مسار بيكون ليه اسم محدد في ملف routes.dart

    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: LoginScreen(),
        ));
      
       case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());


      default:
        // Unknown route
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
