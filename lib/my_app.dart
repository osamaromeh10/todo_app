import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task_model.dart';
import 'package:todo_app/Shared/Styles/my_Theme_Data.dart';
import 'Layout/home_layout.dart';
import 'Providers/my_provider.dart';
import 'Screens/Tasks/Edit_task.dart';
import 'Screens/Tasks/tasks_tab.dart';
import 'Screens/login/login_Screen.dart';
import 'Screens/login/login_tab.dart';
import 'Screens/sign_up/signup_tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.languageCode),

      themeMode: provider.modeApp,
      theme: MyThemeData.lightTheme,

      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute:provider.firebaseUser!=null? HomeLayout.routeName:LoginScreen.routeName,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        TasksTab.routeName:(context) => TasksTab(),
        LoginScreen.routeName:(context) => LoginScreen(),
editTaskScreen.routeName:(context) => editTaskScreen(),
        SignUpTab.routeName:(context) => SignUpTab(),
        LoginTab.routeName:(context) => LoginTab(),



      },
    );
  }



}