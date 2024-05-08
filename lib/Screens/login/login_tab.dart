import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/my_provider.dart';
import 'package:todo_app/Screens/login/Login_Connector.dart';
import 'package:todo_app/Screens/login/login_view_model.dart';
import 'package:todo_app/Screens/sign_up/signup_tab.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';
import 'package:todo_app/base.dart';

import '../../Layout/home_layout.dart';

LoginViewModel viewModel = LoginViewModel();

class LoginTab extends StatefulWidget {
  static const String routeName = "LoginTab";

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends BaseView<LoginViewModel, LoginTab>
    implements LoginConnector {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
 backgroundColor: Colors.white.withOpacity(.4),
        body: Padding(

          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome Back!",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email Or Phone',
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter your Email";
                        }

                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return "enter your valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        //Text you will write
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your Password";
                          }
                          return null;

/*
bool emailValid =
RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
if(!emailValid){
  return "please enter valid password";
}
return null;
                      },

* */

                          onChanged:
                          (value) {};
                        }
                        ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                   FireBaseFunctions.login(emailController.text,
                       passwordController.text, (){
                    goToHome();
                       },
                       (errorMessage){}
                            );
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10.0,),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpTab.routeName);
                        },
                        child: Text('Create a new account',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  goToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeLayout.routeName,
      (route) => false,
    );
  }

  @override
  LoginViewModel initviewModel() {
    return LoginViewModel();
  }
}
