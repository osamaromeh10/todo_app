import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Screens/login/login_tab.dart';
import 'package:todo_app/Screens/login/login_view_model.dart';
import 'package:todo_app/Screens/sign_up/signup_tab.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>viewModel,
      builder: (context, child) =>
          DefaultTabController(length: 2, child: Scaffold(
            appBar: AppBar(title: const Text("Home"), bottom: const TabBar(tabs: [
              Tab(child: Text("Login"),), Tab(child: Text("SignUp"),)


            ])

            ),
            body: TabBarView(children: [
              LoginTab(),
              SignUpTab(),

            ],

            ),
          )),
    );
  }
}
