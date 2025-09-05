import 'package:doc_app/core/di/dependency_injection.dart';
import 'package:doc_app/core/helper/constant.dart';
import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/helper/shared_preferences.dart';
import 'package:doc_app/core/routing/app_router.dart';
import 'package:doc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.amber,
    ),
  );
  await setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  // Here you can implement your logic to check if the user is logged in
  // For example, check if a valid token exists in shared preferences
  // Return true if logged in, false otherwise
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  if (userToken.isStringNullOrEmpty()) {
    isUserLoggedIn = false;
  } else {
    isUserLoggedIn = true;
  }

  return isUserLoggedIn;
}
