import 'package:doc_app/core/routing/app_router.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DocApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doc App',
      
        theme: ThemeData(
          primaryColor:  AppColors.primary,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false, 
        initialRoute: Routes.loginScreen,   
      
        onGenerateRoute: appRouter.generateRoute,
         ),
     
    );

     }
}
